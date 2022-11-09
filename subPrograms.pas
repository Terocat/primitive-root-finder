function mcd(a, b : integer) : integer;
var
    aux : integer;
begin
    if(a < b) then
    begin
        aux := a;
        a := b;
        b := aux;
    end;

    if(a mod b = 0) then
        exit(b);
    exit(mcd(b, a mod b));
end;

function power(base, exponent : integer) : integer;
begin
    if(exponent = 0) then
        exit(1);

    if(exponent mod 2 = 1) then
        exit(base * power(base, exponent div 2) * power(base, exponent div 2))
    else
        exit(power(base, exponent div 2) * power(base, exponent div 2));
end;

function modularPower(base, exponent, m : integer) : integer;
begin
    if(exponent = 0) then
        exit(1);

    if(exponent mod 2 = 1) then
        exit((base * modularPower(base, exponent div 2, m) * modularPower(base, exponent div 2, m)) mod m)
    else
        exit((modularPower(base, exponent div 2, m) * modularPower(base, exponent div 2, m)) mod m);
end;

procedure getMultiplicity(var multiplicity, remainder : integer; n, divisor : integer); // gets multiplicity and
var                                                                                     // stores remainder to n
    i : integer;
begin
    i := 0;
    while((n mod divisor) = 0) do
    begin
        n := n div divisor;
        i := i + 1;
    end;

    multiplicity := i;
    remainder := n;
end;

function isPrime(n : integer) : boolean;
var
    i : integer;
begin
    for i := 2 to trunc(sqrt(n)) do
        if(n mod i = 0) then
            exit(false);

    exit(true);
end;

procedure addToList(var list : ListFactor; factor, exponent : integer);
var
    ptr : ListFactor;
begin
    new(ptr);
    ptr^.value := factor;
    ptr^.exponent := exponent;
    ptr^.next := list;
    list := ptr;
end;

procedure addToGroup(var G : Group; element : integer);
var
    ptr : Group;
begin
    new(ptr);
    ptr^.value := element;
    ptr^.next := G;
    G := ptr;
end;

function getPrimeDecom(n : integer) : ListFactor; // complicated function, read carefully
var
    i, multiplicity, remainder : integer;
    head : ListFactor;
begin
    head := nil;

    if(isPrime(n) or (n = 0) or (n = 1)) then // edge cases listed here
    begin
        addToList(head, n, 1);
    end
    else
    begin
        for i := 2 to trunc(sqrt(n)) do
        begin
            if(isPrime(i) and (n mod i = 0)) then
            begin
                getMultiplicity(multiplicity, remainder, n, i);
                addToList(head, i, multiplicity);

                n := remainder;

                if(isPrime(n)) then
                begin
                    addToList(head, n, 1);            
                    break;  
                end;
            end;          
        end;
    end;

    getPrimeDecom := head;
end;

procedure printList(list : ListFactor);
var
    probe : ListFactor;
begin
    probe := list;
    while(probe <> nil) do
    begin
        write(probe^.value:0, ' ');
        probe := probe^.next;
    end;
end;

procedure printGroup(G : Group);
var
    probe : Group;
begin
    probe := G;
    while(probe <> nil) do
    begin
        write(probe^.value:0, ' ');
        probe := probe^.next;
    end;
end;

function o(g, m : integer) : integer;
var
    i, h : integer;
begin
    h := g;
    i := 1;
    while(h <> 1) do
    begin
        h := (h * g) mod m;
        i := i + 1;
    end;

    o := i;
end;

function getGeneratedG(g, m : integer) : Group;
var
    h : integer;
    head : Group;
begin
    head := nil;

    h := g;
    while(h <> 1) do
    begin
        h := (h * g) mod m;
        addToGroup(head, h);
    end;

    getGeneratedG := head;
end;

// given 2 natural numbers r and s, finds naturals a and b such that a | r , b | r
// mcd(a,b) = 1 and mcm(r,s) = ab

procedure findAandB(r, s : integer; var a, b : integer);
var
    d : integer;
    dDecomp, probe : ListFactor;
begin
    d := mcd(r,s);
    a := r div d;
    b := s div d;

    dDecomp := getPrimeDecom(d);
    probe := dDecomp;
    while(probe <> nil) do
    begin
        if(a mod probe^.value = 0) then
            a := a * power(probe^.value, probe^.exponent)
        else
            b := b * power(probe^.value, probe^.exponent);

        probe := probe^.next;
    end;
end;

