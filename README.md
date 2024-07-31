## Example for Deleting Object & getting Storage Refund on Aptos Move
Here we are creating a simple Object called Object Controller which saves the delete ref for deleting the object. 

By deleting on Aptos we can get a 100% storage refund (subject to be changed later) since the slot is now empty. 
Refund amount is specifically detailed in the storage_fee_refund_octas field of the FeeStatement.

reference image when object is created
<img width="1055" alt="Screenshot 2024-07-31 at 1 43 15 PM" src="https://github.com/user-attachments/assets/aa2bb011-01ea-4f76-8aa6-fddcce9ed4c0">


Link to txn : (https://explorer.aptoslabs.com/txn/5527215569/events?network=testnet)


reference image when object is deleted

<img width="1055" alt="Screenshot 2024-07-31 at 1 43 26 PM" src="https://github.com/user-attachments/assets/2c457e80-8d61-43cc-a9a6-a13fcc58fca2">

Link to txn : https://explorer.aptoslabs.com/txn/5527243530/events?network=testnet


For more details: https://aptos.dev/en/network/blockchain/gas-txn-fee
