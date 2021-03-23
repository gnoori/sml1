(*Name: Guzel Noori
Student ID: 41111792
Assignment: Lab1*)

(*function for making the list*)
fun makeList(m) = 
    if m = 1 then [1]
    else if m>1 then makeList(m-1)@[m]
    else nil;

(*function for removing numbers from the list (l) that are multiples of the given number (m*)
fun removeMult(l, m) = 
    if null l then l
    else if hd(l)mod m <> 0 then hd(l)::removeMult(tl(l),m)
    else if hd(l) mod m = 0 then removeMult(tl(l), m)
    else l;

(*function that outputs a list of all prime numbers <= (n>2)*)
(*||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*)
(*sieve of Eratosthenes function*)
fun sieve(l, m) = 
    if null l then l
    else if m>2 then sieve((m::removeMult(l, m)), m-1)
    else if m=2 then m::removeMult(l, m)
    else l;

(*Square root (x^2) function implementation from Math library*)
fun squareRoot(m) = 
    Math.sqrt(real(m));

(*function for removing the m^2 numbers*)
fun removeSqrt(l, m) = 
    sieve(l, (floor(squareRoot(m))));

(*printing primes omitting the number 1*)
fun primes(m) = 
    if m = 2 then [m]
    else if m > 2 then removeSqrt(tl(makeList(m)), m)
    else nil;