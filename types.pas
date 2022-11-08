type
    ListFactor = ^Factor;
    Factor = 
        record
            value : integer;
            exponent : integer;
            next : ListFactor;
        end;