module my_addr::object_playground {
  use std::signer;
  use std::option;
  use std::string::{String};
  use aptos_framework::object::{Object};
  use aptos_framework::object;
 
  /// Caller is not the owner of the object
  const E_NOT_OWNER: u64 = 1;
 
  #[resource_group_member(group = aptos_framework::object::ObjectGroup)]
  struct ObjectController has key {
    delete_ref: object::DeleteRef,
  }
 
  public entry fun create_my_object(
    caller: &signer,
  ) {
    let caller_address = signer::address_of(caller);
 
    // Creates the object
    let constructor_ref = object::create_object(caller_address);
 
    // Retrieves a signer for the object
    let object_signer = object::generate_signer(&constructor_ref);
 
    // Creates and store the delete ref
    let delete_ref = object::generate_delete_ref(&constructor_ref);
    // ...

    move_to(&object_signer, ObjectController {
      delete_ref
    });
 
  }
 
  /// Now only let the owner delete the object
  public entry fun delete(
    caller: &signer,
    object: Object<ObjectController>,
  ) acquires ObjectController {
    // Only let caller delete
    let caller_address = signer::address_of(caller);
    assert!(object::is_owner<ObjectController>(object, caller_address), E_NOT_OWNER);
 
    let object_address = object::object_address<ObjectController>(&object);
 
    // Retrieve the delete ref, it is consumed so it must be extracted
    // from the resource
    let ObjectController {
      delete_ref
    } = move_from<ObjectController>(
      object_address
    );
 
    // Delete the object forever!
    object::delete(delete_ref);
  }
}