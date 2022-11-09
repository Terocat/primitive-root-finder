type
    ListFactor = ^Factor;
    Factor = 
        record
            value : integer;
            exponent : integer;
            next : ListFactor;
        end;
    Group = ^GroupElement;
    GroupElement =
        record
            value : integer;
            next : Group;
        end;