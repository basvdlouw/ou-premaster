# **Security & IT**

 

# 1. Definitions

## 1.1. CIA
---

### 1.1.1. Confidentiality

> Avoiding unauthorized disclosure of information

Tools for confidentiality:
 - Encryption
 - Acces control (identification, authentication, authorization)
 - Physical security

### 1.1.2. Integrity 

> Avoiding unauthorized altering of information

Tools for integrity:
- Backups 
- Checksums
- Data correcting codes

### 1.1.3. Availability

> Information is accessible and modifiable in a timely fashion by those authorized to do so

Tools for availability:
- Physical protections
- Computational redundancies

## 1.2. AAA
---

### 1.2.1. Assurance


> Providing and managing trust in computer systems

Tools for assurance:
- Policies
- Permissions
- Protections

### 1.2.2. Authenticity 

> Determining that statements, policies, and permissions issued by persons or systems are genuine

Tools for authenticity:
- Signatures

### 1.2.3. Anonymity

> Providing that certain records or transactions cannot be attributed to any individual

Tools for anonymity:
- Aggregation
- Mixing
- Proxies
- Pseudonyms

## 1.3. Vulerability, threat, control, attack
---
### 1.3.1. Vulnerability

> Weakness in the security system

### 1.3.2. Threat

> Set of circumstances that has the potential to cause loss or harm

### 1.3.3. Control

> Protective measure; an action, device, procedure, or technique that removes or reduces a vulnerability

### 1.3.4. Attack

> Person or system that exploits a vulnerability



## 1.4. Threats and Attacks 
---
### 1.4.1. Eavesdropping

> Interception of information intended for someone else during its transmission over a comunnication channel

This is an attack on: ***Confidentiality***

### 1.4.2. Alteration 
> Unauthorized modification of information

- Example: Man in the middle attack (MITM) where a message is intercepted, modified and retransmitted

This is an attack on: ***Integrity***

### 1.4.3. Denial of service (DOS)
> Interruption or degradation of a data service or information acces

- Example: Email spam, to the degree that it is meant to simply fill up a mail queue and slow down an email server

This is an attack on: ***Availability***

### 1.4.4. Masquerading
> Fabrication of information that is purported to be from someone who is not actually the author (spoorfing, impersonation)

This is an attack on: ***Authenticity*** could also be Confidentiality or Anonymity

### 1.4.5. Repudation
> Denial of a commitment or data receipt

This is an attack on: ***Assurance***

### 1.4.6. Correlation and traceback
> Integration of multiple data sources and information flows to determine the source of a particular data stream or piece of information

This is an attack on: ***Anonymity***
 
## 1.5. 10 Security principles
---
### 1.5.1. Economy of mechanism 
> Simplicity in the design and implementation of security measures

### 1.5.2. Fail-safe defaults
> The default configuration of a system should have a conservative protection scheme

### 1.5.3. Complete mediation 
> Every access to a resource must be checked for compliance with a protection scheme

### 1.5.4. Open design
> The security architecture and design of a system should be made publicly available (opposite of security by obscurity

### 1.5.5 Seperation of privilege (compartmentalize)
> Multiple conditions should be required to achieve access to restricted resources or have a program perform some action

### 1.5.6. Least privilege (need-to-know)
> Eech program and user of a computer system should operate with the bare minumum privileges necessary to function properly (concept of need-to-know)

### 1.5.7. Least common mechanism
> In systems with multiple users, mechanisms allowing resources to be shared by more than one user should be minimized

### 1.5.8. Psychological acceptability
> User interfaces should be well designed and intuitive, and all security-related settings should adhere to what an ordinary user might expect

### 1.5.9. Work factor
> The cost of circumventing a security mechanism should be compared with the resources of an attacker when designing a security scheme

### 1.5.10. Compromise recording
> Sometimes it is more desirable to record the details of an intrusion than to adopt more sophisticated measures to prevent it.












# 2. Access control

## 2.1. Access control Matrix
---
> A table that defines permissions
- **row** is associated with a **subject** (user, group, or system that can perform actions)
- **column** is associated with an **object** (file, directory, device, ...)
- **cell** contains **acces rights** for combination of *subject* and *object*

![Access control matrix example](https://i.imgur.com/soleUlC.png)

## 2.2. Access control List
---
> Access control list for object o: lists all subjects that have acces rights for o and their corresponding acces rights

![Column of access control list](https://i.imgur.com/JdtjFBN.png)

## 2.3. Access control Capabilities
---
> Capability list for subject s: lists all objects for which s has nonempty acces control rights, togheter with the specific rights for each such object

**Row** of accces control matrix

![Row of access control capabilities](https://i.imgur.com/NyvPCn8.png)

## 2.4. Role-based access control
---
> Define roles and specify access control rights for these roles, rather than for subjects directly 

![Role-based access control example](https://i.imgur.com/iEKax3U.png)

# 3. Cryptography
## 3.1. Encryption and decryption
![Example](https://i.imgur.com/uh6B5as.png)

**Kerckhoff's principle**: Kerckhoff's principle is the concept that a Cryptographic system should be designed to be secure, even if all its details, except for the key, are publicly known. 

### 3.1.1. Symmetric cryptosystems
---
- **Shared secret key** 

Pros:
- Fast
- Effective

Cons:
- Private key distribution
- A lot of keys required for many users: n(n-1)/2 keys for *n* users

![Symmetric crypto example](https://i.imgur.com/CdhFKio.png)

#### 3.1.1.1 Caesar-cipher

- Classic example of a symmetric cryptosystem
- Encryption algorithm: Move letter *n* positions to the right in the alphabet
- Decryption algorithm: Move letter *n* positions to the left in the alphabet
- Decryption key: The value of *n*

![Caesar-cipher example](https://i.imgur.com/AAtzVuf.png)

### 3.1.2. Asymmetric cryptosystems (Public-key cryptography)
---
- Seperate keys for encryption and decryption. (e.g. *RSA*)
- pk(bob) =/= sk(bob)

Pros:
- Less keys required: 2n keys for *n* users (for every user 1 private key and 1 public key)
- Key distribution isn't a problem (private keys are secret, public keys aren't)
- Effective

Cons: 
- Slow

![Public key crypto example](https://i.imgur.com/GoztAb8.png)

### 3.1.3. Applying cryptography
---
Combining symmetric and asymmetric crypto
- Use *symmetric* crypto because of **speed**
- Distribute this key using *asymmetric* crypto

![proces](https://i.imgur.com/5gzPyWb.png)

## 3.2. Digital Signatures (authenticity)
---

- Use public-key encryption to create digital signature
- To sign message *M*, Alice encrypts it with her private key: *Sig = E<sub>sk(alice)</sub>(M)*
- Anyone can decrypt this message using Alice's public key: *M = D<sub>pk(alice)</sub>(Sig)*

Note:
- *Sig* does **not** provide confidentiality
- ... but **guarentees** authenticity
- However, *Sig* is as long as *M* and computing *Sig* takes times

### 3.2.1 Cryptographic hash functions
---
- Use cryptographic hash function to compute 'checksum' of a message *M*
- Good cryptographic hash function is
    - One-way (pre-image resistant): easy to compute *y = h(M)*, but hard to find *M* given *y*
    - Colission-resistant: hard to find messages *M*, *N* where *M* =/= *N*, such that *h(M)* = *h(N)*
Examples: *~~MD5~~*, *~~SHA-1~~*, *SHA-3*



#### 3.2.1.1 Fingerprint
- Small representation of a larger thing
- Uniquely identifies larger thing

## 3.3. Man in the middle attack
---
![MITM example](https://i.imgur.com/hB73IgK.png)
MITM in **symmetric crypto**
- MITM should *not* know shared secret key, and hence cannot change *C* into *C'* in **determined** way
- but can still make modifications to *C*

MITM in **asymmetric crypto** (public-key encryption)
- MITM **knows** public key and **can** replace *C* with *C'*

![Example](https://i.imgur.com/18NrkaA.png)
### 3.3.1. MITM Defense
---
**Integrity** against MITM in **symmetric encrpytion** is ensured by *Message authentication code* (MAC)
- Alice and Bob share a secret key *K*
- Alice computes hash *h(K||M)* and sends *M* and hash to Bob
![Example](https://i.imgur.com/qidZJBf.png)

**Authenticity** against MITM in **asymmetric encryption** is ensured with *Digital signature* AND *Hash function*

**INVALID WAY OF TRYING TO PREVENT MITM ATTACK**:
![Wrong way of preventing MITM](https://i.imgur.com/l3SCtGU.png)

**PROPER WAY OF PREVENTING MITM ATTACK**:
- Alice creates digital signature Sig = *E<sub>sk(Alice)</sub>(h(M))*
- Alice sends *Sig* with *M*

- MITM
    - can obtain *h(M)*, but **not** *M*, from *Sig*:
    *(h(M)) = D<sub>pk(Alice)</sub>(Sig)*
    - could replace *M* by *M'*, but **cannot** compute *Sig'* (does not know Alice's private key)
    - also **cannot** create valid *M'* for *Sig'* by random modification of *Sig*, since cannot compute an *M'* for which holds that
    *h(M') = D<sub>pk(Alice)</sub>(Sig')* (preimage resistance)

![Example](https://i.imgur.com/7nTPqwD.png)

## 3.4. Certificates
---
Public-key cryptography: How to distribute a public key?

Certifcate 
- contains identity and public key of the owner
- is signed by a Certificate Authority (CA). CA is publisher of certificates and a trusted third party 

## 3.5. Ciphertext
---
Two ways of encrypting something
- Substitution (write something else)
- Transposition (write at a different place)

### 3.5.1. Substition
---
Monoalphabetic cipher (e.g. Caesar-cipher). Very easy to crack with:
- Brute force attack
- Statistic analysis (frequency of letters)

Polyalphabetic cipher 

- Vigenère cipher (not safe)

        Example: 

        Clear text: COMPLOT

        Key: lus

        Ciphertext: nieafge

![Example](https://i.imgur.com/1WqKtV7.png)

- One-time pad (Vernam Cipher)

        Vignere cipher with random key (uncrackable)

### 3.5.2. Transposition
---
- Changing the order of symbols in clear text (permutation)
- Transposition is a block cipher

![Example](https://i.imgur.com/uEo7Fvn.png)

Transposition with key: the key *open* is added at the start. Column 1 is the start of the cipher (alphabetical order). So the cipher will be **eeisinnvit..**

![Example](https://i.imgur.com/dP0OqJT.png)

### 3.5.3. Stream cipher vs block cipher 
---
#### 3.5.1. Stream cipher 
- Encrypt symbol after symbol
#### 3.5.2. Block cipher
- Divide clear text into blocks
- Encrypt block after block
- Example: Advanced Encryption Standard (AES), blocks per 128 bits. (final block usually needs to be padded)
### 3.5.3. Advanced Encryption Standard (AES)
---
- Symmetric block cipher 
- Datablocks of 128 bits
- Secret key of 128, 192 or 256 bits
- 10, 12 or 14 rounds depending on key
- Uses byte **substition**, **row shift** (permutation), **column mix** (matrix multiplication) and **xor-addition** 

![AES Example](https://i.imgur.com/nxO1FyQ.png)

A round of AES:
- 1. Bytesubstition
- 2. Bytetransposition
- 3. Columnmix
- 4. Xor with the round key (round key is based on the private/encryption key)
- 5. Start next round

![AES round](https://i.imgur.com/rIeooS7.png)

## 3.5.4 Rivest-Shamir-Adelman encryption (RSA)
---
- Choose 2 (big) prime numbers *p* and *q*
- Compute *n = pq* and *z = (p-1)(q-1)*
- Choose any number *e* where *e < n* and *gcd(e, z) = 1*
- Compute number *d* where *d < z* and *ed mod z = 1*
---
- Public key *K<sub>e</sub> = (e, n)*
- Private key *K<sub>d</sub> = (d, n)*
---
- Clear text *P*, ciphertext *C*
- Encrypt *C = P<sup>e</sup> mod n*
- Decrypt *P = C<sup>d</sup> mod n*

![RSA Example](https://i.imgur.com/r4rWTPD.png)

Example
---
- Choose 2 prime numbers *p = 11* and *q = 3*
- Compute *n = pq*, *n = 11 * 3 = 33*
- *z = (p-1)(q-1)*, *z = (10)(2)*, *z = 20*
- Choose a number *e* where *e < n* and *gcd(e, z) = 1*
- *e = 3* 
- Compute number *d* where *d < z* and *ed mod z = 1*
- *d = 7* (7*3 = 21 mod 20 = 1)
---
- Public key = (e, n) = (3, 33)
- Private key = (d, n) = (7, 33)
---
- Clear text *P = 7*
- Encrypt *C = P<sup>e</sup> mod n*, *C = 7<sup>3</sup> mod 33 = 13*
- Decrypt *P = C<sup>d</sup> mod n*, *7<sup>7</sup> mod 33 = 7* 

### 3.5.4.1 RSA Security
---
- RSA security is based on the complexity of factorizing. 
- The fastest algorith for this is based on exponential growth.
- 1999: 512-bit number factorized took 4months (35.7 CPU years)
- In 2018 3072-bit keys were defined as secure for the next period (2020-2040)

Key length difficulty time to decrypt:

![RSA difficulty](https://i.imgur.com/xivYPs6.png)

## 3.6. Diffie-Hellman protocol
---
> Protocol for exchanging private keys

- Alice and Bob choose a (publicly) primenumber *p* and base number *g* (grondgetal)
- Alice chooses secret number *a* 
- Bob chooses secret number *b*.
- Alice computes *A = g<sup>a</sup> mod p* 
- Bob computes *B = g<sup>b</sup> mod p*
- Alice sends A to Bob
- Bob sends B to Alice
- Private key *K = B<sup>a</sup> mod p = A<sup>b</sup> mod p = g<sup>ab</sup> mod p*

### 3.6.1. Diffie-Hellman MITM attack
---
- Problem with Diffie-Hellman: Lack of authentication
- MITM can start a Diffie-Hellman procedure with Alice and another Diffie-Hellman procedure with Bob

![DH MITM](https://i.imgur.com/n90jmHq.png)

# 4. Operating Systems

# 4.1. OS Concepts
> Operating System (OS) provides interface between users and hardware

OS Manages:
- Access to resources (disk drives, CPU, memory, input devices, output devices, network interfaces)
- Multiple users
- "Concurrent" execution of multiple programs

![OS layout](https://i.imgur.com/w1eoTHo.png)

## 4.1.1. Process
---
> A process is an instance of a program that is currently executing

When executed, program is loaded into memory and uniquely identified as a process (process ID, PID)

## 4.1.2. File system
---
- Abstraction of how external (nonvolatile) memory is organized
- Files organized hierarchically into folders/maps/directories
- File permissions are checked by OS to determine if a file is readable, writeable, or executable by a user or group of users
    - Unix-like OS: file permission matrix (read, write, execute permission for owner, group, others/world)

Example File permissions

![File permission example](https://i.imgur.com/PrDaDTN.png)

Example Directory permissions

![Directory permissions example](https://i.imgur.com/2QvEs6I.png)

### 4.1.2.1. Set-user-ID
---
>setuid-bit in executable files causes program to run with permissions of file owner (regardless of who runs it)

- ignored for everything else
 
Set-user-ID example

![Setuid example](https://i.imgur.com/2TLkc6K.png)

### 4.1.2.2. Linux vs Windows file permissions 
---
- ACL is ordered list of acces control entries (ACES)
    - ACE: principle, type (allow/deny), permission
    
        e.g.: owner, allow, read+write+execute

- Linux
    - allow-only ACEs
    - access to file allowed only if:
        - ACL of file allows requested access
        - ACLs of all ancestor folders (on path from root to target file) must have execute permission

- Windows
    - allow and deny ACEs; by default, deny ACEs precede allow ACEs
    - access to file depends only on file's ACL

## 4.1.3. Memory management
---
- Address space contains code of running program, data, and its working memory
    - **text**: actual (binary) machine code of program
    - **data**: static program variables (initialized)

    e.g.: int i = 3;
    - **BSS** (block started by symbol): static program variables (unitinialized)

    e.g.: 
    static int i;

    - heap: **dynamic** data generated during execution of process

   e.g.: new Integer i;

    - **stack**: call structure of subroutines/methods/functions and their arguments 

![Memory](https://i.imgur.com/zgDfFGq.png)

### 4.1.3.1. Virtual memory
---
- OS gives each running process the illusion that it has access to its complete (contiguous) address space

- Memory divided into pages; OS keeps track of which pages oens are in memory and which pages are stored on disk 

![Virtual memory example](https://i.imgur.com/PLawAjd.png)

## 4.1.4. Virtual machine 
---
- Run OS (and applications) inside virtual machine
- Software layer hypervisor/virtual machine monitor
- Benefits: hardware efficiency, portability, **security**, management

![VM example](https://i.imgur.com/jfxdrpQ.png)

## 4.1.5. Boot sequence
---
- Booting/bootstrapping:
loading an OS into memory from powered-off state
    - first execute code stored in **BIOS** (/ UEFI) (Basic Input/Output System, a firmware component)
    - BIOS loads second-stage boot loader into memory, which handles loading rest of OS into memory, and then passes control of execution to OS

- Malicious user could seize execution of a computer at several points in boot process
    - BIOS password prevents second-stage boot loader to be executed without proper authentication
    - boot device hierarchy


![BIOS](https://i.imgur.com/UltQn1c.png)

## 4.1.6. Monitoring and event logging
---
- Keep track of running processes, network communication, unexpected/ suspucious behaviour 
- Windows Process explorer/Linux top

# 4.2. OS Attacks

## 4.2.1. Memory and filesystem security
---
- Hibernation file: saving contents of entire memory to disk when powering-off (may include sensitive data such as passwords)
    - Windows does not delete hiberfil.sys after resuming execution
    - Uncover passwords, or modify hyberfil.sys

- Virtual memory pages (page/swap file)
    - delete at power-off, encrypt

## 4.2.2. Password security
---
- OS stores cryptographic hashes of passwords in password file

- **Dictionary attack**
    - Crack hashes of passwords that are in the list ("dictionary")
    - Use dictionary passwords, compute hashes, and compare with hashed passwords in password file
    - Dictionary of 500.000 words enough to discover most passwords


- Use **salting** to make dictionary attack more difficult 
    - Associate random number (salt) with each userid
    - Store hash of password with salt *h(S||P)*, instead of *h(P)*
    - If attacker **does not know** salt associated with userid, search space for a dictionary attack increases to 2<sup>B</sup> * D (random salt of B bits, list of passwords size D; e.g. B = 32, D = 500.000, then more than 2 * 10<sup>15</sup>)

    - If attacker **does know salt** associated with userid, dictionary attack **only for one hash** at a time (rather than all users)

Client:
- use a PW manager
- use generated passwords

Server:
- Only store **hashed, salted** passwords
- use a **slow** hash function

## 4.2.3. Discretionary vs mandatory access control
---
### 4.2.3.1. Discretionary access control (DAC)
---
- Users can protect what they own
- Owner may grant access to others and define type of access to others (read/write/execute)
- Standard user in operating systems

### 4.2.3.2. Mandatory access control (MAC): SELinux
---
- Users cannot decide on security attributes of their own files
- Delegated to central security policy administrator
- Multiple levels of security for users and documents
- Match subject's permissions to object requirements

### 4.2.3.3. Mutilevel security
---
- Information is hierarchically classified
- Granting security labels to subjects and objects (clearance level for subject, classification level for object)
- Classic example: Military security policy

### 4.2.3.4. Security models
---
- Military security
- Bell-LaPadula (confidentiality)
- Biba (Integrity)

#### 4.2.3.4.1. Military security policy
---
- Information is hierarchically classified
- Access is limited via need-to-know rule
- Every piece of information is assigned to a compartment
- rank; compartments

    Subjects: clearance

    Objects: classification
- Security officer manages clearances and classifcations

- Access from subject s to object o only allowed if: **rank(o) <= rank(s)** and **compartments(o) ⊆ compartments(s)**

![Military policy](https://i.imgur.com/JYJV3kH.png)

#### 4.2.3.4.2. Bell-LaPadula (Confidentiality)
---
- No passing around of information from 'high' to 'low'
- **No read-up**
- **No write-down**

![Bell-LaPadula](https://i.imgur.com/MLSCD5Z.png)

#### 4.2.3.4.3. Biba (Integrity)
---
- No writing of information from 'low' to 'high'
- **No read-down (can't write higher than read rights)**
- **No write-up**

![Biba](https://i.imgur.com/Fste6Qe.png)

## 4.3. Buffer overflow
---
- Programming languages without implicit memory management (C/C++)

Example

![Buffer overflow](https://i.imgur.com/Lus1v69.png)

### 4.3.1. Stack smashing
---
- Inject malicous code in buffer
- "Smash" the stack by causing a buffer overflow.
- Add dummy data to fill up the stack
- Overwrite the return address to the location of the malicous code

![Stack smashing](https://i.imgur.com/u2KY8F8.png)

Example

![example](https://i.imgur.com/5yopCRf.png)


### 4.3.2. Stack-based buffer overflow attack
---
- Difficulties when performing stack-based buffer overflow attack
    - Guess location of return address
    - Guess location of buffer in address space

- Approaches to deal with this
    - **NOP sledding**
    - **Jump-to-register or trampolining** (use predictable location of libraries to execute malicious code)
    - **Return-to-libc** (call libc function with argument pointer to malicious code)

NOP sledding 

>In computer security, a NOP slide, NOP sled or NOP ramp is a sequence of NOP (no-operation) instructions meant to "slide" the CPU's instruction execution flow to its final, desired destination whenever the program branches to a memory address anywhere on the slide.


![NOP sledding](https://i.imgur.com/ve7S3qT.png)

Jump-to-register

![jump to register](https://i.imgur.com/x1wyulF.png)

Return-to-libc

![Libc](https://i.imgur.com/zq569s2.png)

### 4.3.3. Preventing stack-based buffer overflow
---
- Compiler
    - Canary: placed in stack prior to return address (any attempt to over-write return address also over-writes canary)
    - Microsoft PointGuard: **XOR**-encode return address
![Canary](https://i.imgur.com/PNibvCK.png)

- OS
    - address-space layout randomization (ASLR)

- Hardware 
    - no-execution permission of stack memory segment

    **DEP**: Data Execution Prevention (RxW)
    (You cant run code where you are allowed to write)

## 4.4. Formal string attacks
---
- Prevented by sanitizing user input and not allowing user to specify template (%n)


![Example](https://i.imgur.com/2PH03Gk.png)

## 4.5. Timing attacks
---
Simple example
- Check privilege
- ..handle result..
- Access protected data and functions

These actions need to be an atomic operation.
Otherwise a timing attack can be used to exploit for example elevated permissions from setuid bit

![Example](https://i.imgur.com/SAn8UD2.png)

## 4.6. Heap based buffer overflow attacks
---
Problem: Strcpy add argv into buffer. Arg too big for buffer and heap overflows.

Solution: use Strncpy instead so you can specify amount of bytes allowed (255)
![Example](https://i.imgur.com/nLzvyNb.png)

# 5. Web security
## 5.1. HTML forms: GET vs POST
---
- GET: request data from server
- POST: send data to server

- GET requests are saved in browserhistory and can be added to bookmarks

- Variables
    - GET: Send in URL e.g.: https://www.google.nl/search **?q=test**
    - POST: in body of HTTP request

Example GET request

![Example get](https://i.imgur.com/D0PWxsZ.png)

Example POST request

![Example post](https://i.imgur.com/uhddyhX.png)

## 5.2. HTTPS 
---
![HTTPS](https://i.imgur.com/539QMNB.png)

### 5.2.1. HTTPS - What can go wrong?
---
- Trust in certificates and certificate authorities
- Strength of used cipher
- Used version and implementation of SSL/TLS
- Attacks that avoid the use of HTTPS

- MITM attack between client and server

![MITM](https://i.imgur.com/5s9zakT.png)

- SSL Stripping

![SSL stripping](https://i.imgur.com/LZK2yA4.png)

- Man-in-the-browser

![Man in the browser](https://i.imgur.com/BJWfdEl.png)

## 5.3. Sessions
---
- TCP-session
    - threeway handshake between client and server
    - sequence numbers and acknowledgement-numbers
    - no guarentee for confidentiality, integrity or authenticity

- HTTP-session
    - Uses TCP
    - Consists of related HTTP requests and responses
    - **Session identifier** (for authentication), via sessionvariable or **cookie**

### 5.3.1. Session hijacking 
---
- HTTP is a **stateless** protocol in the application layer
- To maintain a state, client needs identifier 
    - Called user session with a **session ID**
- Session identifier sent from client-side to server-side
    - GET or POST
    - **cookies**
- Of course, the session identifier has to be stored server-side too

**HTTP session hijacking**:
- Session prediction
    - Attacker tries to guess the session ID
    - Counter-measure: Only send session ID through a **secure** connection, use **random** value

- Session fixation
    - Attacker forces user to use specific session ID (e.g. through phishing)
    - Counter-measure: 
        -  **Generate new session ID on login**
        - **Authenticate again** for important actions (e.g. wire money)

## 5.4. Click-jacking
---
- Attackers try to confuse the user into unintentionally doing something that the attacker wants, such as 
    - Clicking a link
    - Supplying text input in fields

- Can be used to try to steal cookies 

![Example](https://i.imgur.com/XozfPoP.png)

## 5.5. Click fraud
---
![Click fraud](https://i.imgur.com/dfU2agg.png)

## 5.6. UI Redressing
---
- Attacker creates a malicous web page that includes elements of a target website

- Typically uses iframes (inline frames)
    - Frame: part of a webpage, a sub-window in the browser window
    - Internal frame (iframe) allows more flexible nesting and overlapping

- Often including transparent layers to make elements invisble

Example

![Flash player](https://i.imgur.com/kLaPYIF.png)

### 5.6.1. Defense against UI redressing
---
- **Frame busting**: The website tries to bust any frames it is included in, typically using JavaScript

Example

![Example](https://i.imgur.com/afw5QAP.png)

## 5.7. Sandbox
---
- Restrict privileges of applications/scripts that run inside another application 

![Sandbox](https://i.imgur.com/T4lBFvr.png)

## 5.8. Cross site scripting (XSS)
---
### 5.8.1. Reflected (non-persistent) XSS
---
![Reflected XSS](https://i.imgur.com/EMzp58D.png)

Example to steal cookie

![Example](https://i.imgur.com/ddIJqIw.png)

### 5.8.2. Stored XSS
---
![Stored XSS](https://i.imgur.com/GhqWHnW.png)


![Example]

### 5.8.3. Preventing XSS
---
**Server side**
- I/O validation at server-side
    - Web Application Firewall (WAF): Monitor and filter HTTP traffic to and from server
    - HTML sanitization: remove tags like \<script>, \<embed> and attributes like onclick
    - Output encoding/escaping: replace metacharacters that have special meaning, e.g.: replace < and > by %3C and %3E
    - Use proper encoding 
        - HTML encoding for HTML
        - CSS encoding for CSS
        - etc..

**Client side**
- XSS filter (in browser or browser plugin like NoScript)
- Content Security Policy (CSP)
    - Server sends CSP header in a response to client
    - CSP header contains access policy (**whitelist**, indicating which resource may be accessed for what content)
    - Client executes this policy

Example

![CSP example](https://i.imgur.com/IO5KGBA.png)


## 5.9 CSRF (Cross-Site Request Forgery)
---
- Malicious website causes a visitor to unwittingly issue an HTTP request for another website, where the user is already authenticated

- Hence, website trusts this user due to cookie

- In the simplest form, this can be done with just a link, e.g.

![CSRF example](https://i.imgur.com/WkzXUN7.png)

- Requirements:
    - Victim must have a valid cookie for the attacked website
    - The site must have actions which only require a single HTTP request

- Can resemble click-jacking, but it doesn't have to

#### 5.9.1. Preventing CSRF
---
**Client-side**
- User
    - Hover over link 
        - But script on the webpage could hide this info
    - **Log out** before visiting other websites
    - **Private browsing** (no cookies are stored)
    - Use different browsers for visiting websites at different trust levels (QubeOS)

- Browser extensions and client-side proxies
    - **Strip authentication cookies** from potentially malicious cross-site requests sent by the browser
    - Apply heuristics to decide when a request is a cross-site request

**Server-side**
- SameSite cookie flag
- Allowed Referrer Lists (ARLs)
    - Whitelist that specifies which origins are entitled to send authenticated requests to a given website
    - Whitelist is compiled by web developers
    - Enforcement is done by the browser
- Effective, provided that no content injection vulnerability affects any of the whitelisted pgaes
- Compiling ARL may require some effort
    - e.g PayPal: ARL for e-commerce websites may include PayPal, but ARL for PayPal may be large and rather dynamic

**Possible defenses against CSRF**
- Let users re-confirm any security-critical operation
- Keep user sesssions short (expire cookies, by having a short lifetime, or terminate sessions after some period of inactivity)
- Look at Referer-header/Origin-header in HTTP request

- **Tokenization**: in addition to cookie, also have some extra (randomly generated) authentication token (e.g. as hidden field in HTTP request), that the attacker cannot know in advance

## 5.10 CSRF vs XSS
---
- CSRF does not require JavaScript (for GET actions)
- XSS always does
- CSRF: targets a server (except client-side CSRF)
- XSS: targets the browser

For any JavaScript used:
- CSRF runs code on the attacker's website 
- XSS runs code on the targeted website

Server-side validation
- can prevent XSS, cannot prevent CSRF 
    - But tokenization can be added

## 5.11. Same-Origin Policiy (SOP)
---
- Built-in browser security measure against client-side attacks
- A client script originating from one server can only read data originating from another server if they have the same origin
- Origin: \<URI scheme, host name, port>
- SOP does not protect against XSS
    - Script is already included in webpage from server (and hence has same origin)

Example

![Example SOP](https://i.imgur.com/D3pqyCT.png)

# 5.12. Denial-of-service attacks 
---
- Preventing DDoS attacks
     - Multiple webservers (Load balancing)
     - Web Application Firewall (WAF), with specialized network intrastructure providers (e.g.: Akamai)

![Example DDoS](https://i.imgur.com/2vNIVOB.png)

# 6. Databases
Two-phase commit

![Two phase commit](https://i.imgur.com/NaW3th7.png)

## 6.1. Database access control
---
- Least-privilege principle 
    - Each user has necessary rights to perform required tasks, but no rights beyond that

- Seperation of privilege principle
    - Different users have different privileges, depending on different tasks that they need to perform

Granting rights

![Grants](https://i.imgur.com/PjQd6Gf.png)

Revoking rights

![Revoking rights](https://i.imgur.com/ky9Tpvi.png)

## 6.2. Sensitive data

![Sensitive data](https://i.imgur.com/is0dgAu.png)


### 6.2.1. Protecting against inference attacks

![Example](https://i.imgur.com/AnyUZFM.png)

### 6.3. SQL Injection attack

- Attacker can enter special strings and execute his own SQL code

Example:

![Example](https://i.imgur.com/7ixhhiB.png)