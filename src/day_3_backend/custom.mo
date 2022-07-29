import Nat "mo:base/Nat";
import Principal "mo:base/Principal";

module {
    public type Kitty = {
        dna : Text; // DNA of the kitty
        price : Nat; // price of the kitty
        owner : Principal; // owner of the kitty
        gender : Gender;
    };
    public type Gender = {
        #unknown;
        #male;
        #female;
    };
}