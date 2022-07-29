module {

    public type List<T> = ?(T, List<T>);

    public func is_null<T>(l : List<T>) : Bool {
        switch(l){
            case (null) {true};
            case (_) {false};
        }
    };

    public func last<T>(l : List<T>) : ?T {
        switch (l) {
            case (null) {null};
            case (?(x, null)) {?x};
            case (?(_, li)) {last<T>(li)};
        }
    };

    public func size<T>(l : List<T>) : Nat {
        switch(l) {
            case (null) {0};
            case (?(_, null)) {1};
            case (?(_, li)) {1 + size<T>(li)};
        }
    };

    public func get<T>(l : List<T>, n : Nat) : ?T {
        switch(l, n){
            case(null, _) {null};
            case(?(x, _), 0) {?x};
            case(?(_, li), _) {get<T>(li, n - 1)};
        }
    };
}