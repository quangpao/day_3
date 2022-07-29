import Trie "mo:base/Trie";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";

actor class{

  //CRUD with Trie
  type Person = {
    name : Text;
    age : Nat;
    address : Text;
    sex : Bool;
  };

  //application state
  stable var persons : Trie.Trie<Nat, Person> = Trie.empty();
  stable var next : Nat = 0;
  
  //create key
  private func key(x : Nat) : Trie.Key<Nat> {
    return {
      key = x;hash = Hash.hash(x);
    };
  };

  //write create function
  public func create_account(p : Person) : async Bool {
    next += 1;
    let id = next;
    let (newPersons, existing) = Trie.put(
      persons,
      key(id),
      Nat.equal,
      p
    );

    switch(existing) {
      //if there is no existing person with the same name, then create the person
      case (null) {
        persons := newPersons;
      };
      case (?v) {
        return false;
      };
    };
    return true;
  };

  //Write read function
  public func read_acccount(id : Nat) : async ?Person {
    let result = Trie.find(
      persons,
      key(id),
      Nat.equal
    );
    return result;
  };

  //Write update function
  public func update_account(id : Nat, p : Person) : async Bool {
    let result = Trie.find(
      persons,
      key(id),
      Nat.equal
    );
    switch(result) { //Test if its ability same to Rust
      case (null) {
        return false;
      };
      case (?v) {
        persons := Trie.replace(
          persons,key(id),Nat.equal, ?p
        ).0;
        return true;
      };
    };
  };

  //Write delete function
  public func delete_account(id : Nat) : async Bool {
    let result = Trie.find(
      persons,
      key(id),
      Nat.equal
    );
    switch(result) {
      case (null) {
        return false;
      };
      case (?person) {
        persons := Trie.replace(
          persons,key(id),Nat.equal, null
        ).0;
        return true;
      };
    };
  };

}