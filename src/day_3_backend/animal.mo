module{

    public type Animal = {
        species: Text;
        energy: Nat;
    };

    // public type Species {
    //     #amphibians : Text;
    //     #birds : Text;
    //     #mammals : Text;
    //     #reptiles : Text;
    //     #fish : Text;
    //     #invertebrates : Text;
    // }

    public func animal_sleep(animal: Animal) : Animal {
        return {
            species = animal.species;
            energy = animal.energy + 10;
        }
    };

    //not finished
    public func advance_sleep(animal: Animal) : Animal {
        animal
    };

}