import Person "person";
import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";
actor class {
  //Testing
    public type Person = Person.Person;
    let tom : Person = {
        name = "Tom";
        age = 30;
    };

    public func test() {
      let tom_name = tom.name;
      let tom_age = tom.age;
      Debug.print(debug_show(tom_name));
      Debug.print(debug_show(tom_age));
    };

    public type List<T> = ?(T, List<T>);
    public func is_list_null(list : List<Nat>) : async Bool {
      switch(list) {
        case(null){
          return true;
        };
        case(?list){
          return false;
        };
      };
    };

    public shared(msg) func whoami() : async Principal { 
      let principal_caller = msg.caller;
      return principal_caller;
    };

    let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
    let users = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);
    users.put(anonymous_principal, "This is anonymous principal");
    public func testPrincipal() :  async ?Text {
        users.get(Principal.fromText("2vxsx-fae"));
    };

    public func balance() : async Nat {
      Cycles.balance()
    };

    public func message_available() : async Nat {
      Cycles.available()
    };
  //End of demo example

  //New Test
    stable var my_name : Text = "";

    public func change_name(name : Text) : async (){
      my_name := name;
    };

    public func show_name() : async Text {
      return my_name;
    };

  //
}

