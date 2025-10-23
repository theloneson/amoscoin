module my_first_coin::MyCoin {

    use sui::tx_context::{Self, TxContext};

    struct amoscoin has key {
        value: u64
    }

    public entry fun mint(ctx: &mut TxContext) {
        let coin = amoscoin { value: 100 };
        sui::transfer::transfer(coin, TxContext::sender(ctx));
    }
}
