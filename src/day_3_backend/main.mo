import Nat "mo:base/Nat";
import Custom "custom";
import Principal "mo:base/Principal";
import Animal "animal";
import List "mo:base/List";
import LocalList "list";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Cycles "mo:base/ExperimentalCycles";
import Debug "mo:base/Debug";
actor {


  ///////////////// 1 --> 6 //////////////////
  //Challenge 1
  public type Gender = Custom.Gender;
  public type Kitty = Custom.Kitty;
  stable var kitty : Kitty = {
    dna = "3A5bze8RkFx";
    price = 4000;
    owner = Principal.fromText("2vxsx-fae");
    gender = #male;
  };
  public func fun() : async Kitty {
    kitty
  };

  //Challenge 2 & 3
  public type Animal = Animal.Animal;
  stable var cow : Animal = {
    species = "Mammals";
    energy = 500;
  };

  //Challenge 4
  public func create_animal_then_takes_a_break(a : Animal) : async Animal {
    var animal : Animal = a;
    animal := Animal.animal_sleep(animal);
    animal
  };

  //Challenge 5
  type List<Animal> = ?(Animal, List<Animal>);
  stable var animalList : List<Animal> = List.nil();

  //Challenge 6
  public func push_animal(a : Animal) : async () {
    animalList := List.push(a, animalList);
    ()
  };

  public func get_animals() : async [Animal] {
    List.toArray(animalList)
  };
  //////////////////////////////////////////



  //Challenge 7 -> 10
  type LocalList<Nat> = LocalList.List<Nat>;
  //////////////////////////////////////////



  //Challenge 11
  let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
  public shared(msg) func is_anonymous() : async Bool {
    if (msg.caller == anonymous_principal){
      return true
    };
    false
  };
  //////////////////////////////////////////


  //////////////// 12 --> 15 ///////////////
  //Challenge 12
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
  
  //Challenge 13 + 14
  public shared(msg) func add_favorite_number(n : Nat) : async Text {
    let caller = msg.caller;
    switch(favoriteNumber.get(caller)){
      case(null) {
        favoriteNumber.put(caller , n);
        "You've successfully registered your number"
      };
      case(_) {"You've already registered your number"};
    };
  };
  public shared(msg) func show_favorite_number() : async ?Nat {
    let caller = msg.caller;
    favoriteNumber.get(caller)
  };

  //Challenge 15
  public shared(msg) func update_favorite_number(n : Nat) : async Text {
    let caller = msg.caller;
    let result = favoriteNumber.replace(caller, n);
    switch(result){
      case (null) {"You have no favorite number to change"};
      case (_) {"Your favorite number has been updated"};
    }
  };

  public shared(msg) func delete_favorite_number() : async Text {
    let caller = msg.caller;
    let result = favoriteNumber.remove(caller);
    switch(result){
      case (null) {"You have no favorite number to remove"};
      case (_) {"Your favorite number has been removed"};
    }
  };
  //////////////////////////////////////////


  //////////////// 16 --> 17 ///////////////
  //Challenge 16
  let AMOUNT_TO_DEPOSIT : Nat = 100_000;
  public func deposit_cycles() : async Nat {
    Cycles.add(AMOUNT_TO_DEPOSIT);
    AMOUNT_TO_DEPOSIT
  };

  //Challenge 17
  // Chịu đấy
  //////////////// 16 --> 17 ///////////////
  

  //Challenge 18
  stable var counter = 0;
  stable var versionNumber = 0;
  public func increase_counter(n : Nat) : async Nat {
    counter += n;
    counter
  };
  public func clear_counter() : async Nat {
    counter := 0;
    counter
  };

  system func postupgrade() {
    versionNumber += 1;
  };
  public func get_version_number() : async Nat {
    versionNumber
  };
}