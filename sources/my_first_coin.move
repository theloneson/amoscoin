module my_first_coin::MyCoin {
    
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::object::{Self, UID};

    // Must be public (Move 2024) and for Sui objects 'id: UID' must be first field
    public struct AmosCoin has key {
        id: UID,
        value: u64,
    }

    // Entry function to mint and transfer the created object to the transaction sender
    public entry fun mint(ctx: &mut TxContext) {
        let coin = AmosCoin {
            id: object::new(ctx),
            value: 100u64,
        };
        transfer::transfer(coin, tx_context::sender(ctx));
    }
}
