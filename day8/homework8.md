Student Name: Bill Wong\
Check one:\
[ ] I completed this assignment without assistance or external resources.\
[x] I completed this assignment with assistance from ___
   and/or using these external resources: Google


## 1
a) Not regular: start with `aaaa`, loop two a's to get `aaaaaa`, which is a^6 which is not in the language.

b) Regular? `0*1*(01)*1*0`

c) Not regular, if you pump a substring that does not span the middle of the string, it will no longer be a mirror of the other side.

## 2

 - Number 16: `L = {a^n b a^n}`
    - My word: `aaaaaabaaaaaa`
    - Computer chose: `aaaaa(ab)aaaaaa`
    - Pumped string: `aaaaaaaaaaa`
 - Number 6: `L = {a^n ∣ n is prime}`
    - My word: `aaaaaaaaaaaaaaaaaaaaaaaaaaaaa`
    - Computer chose: `(aaaaaaaaaaaaaaaaa)aaaaaaaaaaaa`
    - Pumped string: `aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa`

## 3
Picture of PDA for number 16 included.