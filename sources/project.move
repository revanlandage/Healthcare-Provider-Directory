module MyModule::HealthcareDirectory {

    use std::string;
    use aptos_framework::signer;

    /// Struct to store healthcare provider information
    struct Provider has store, key {
        name: string::String,
        specialization: string::String,
    }

    /// Register a new healthcare provider with their name and specialization
    public fun register_provider(account: &signer, name: string::String, specialization: string::String) {
        let provider = Provider {
            name,
            specialization,
        };
        move_to(account, provider);
    }

    /// View function to get provider's information by their address
    public fun get_provider_info(provider_addr: address): (string::String, string::String) acquires Provider {
        let provider = borrow_global<Provider>(provider_addr);
        (provider.name, provider.specialization)
    }
}
