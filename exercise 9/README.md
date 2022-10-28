  ### **CALCULATION  OF NETWORK IP, NUMBER OF HOSTS, RANGE OF IP ADDRESSES AND BROADCAST IP FROM A GIVEN SUBNET**
In computer networks, an IP address is a unique address that identifies a device on the internet or a local network. Using IP address we can find information about the Class of IP address and number of computers connected in that network (range of IP address in that network), network IP address, broadcast address.

The given Ip address and subnetmask is 193.16.20.35/29. Where the IP address is 193.16.20.35 and the subnet mask is 29.1. 

**CALULATION OF NETWORK IP**

This is done using the following steps:

**STEP 1:** The given IP address is written in binary format.

` 193.16.20.35 => 11000001.00010000.00010100.00100011`


**STEP 2:**  The given subnet mask is also written in binary form.

`29 => 11111111.11111111.11111111.11111000`


**STEP 3:** The **logical AND** operation is performed between the corresponding octets of the IP address and the subnet mask.

     193.16.20.35 => 11000001.00010000.00010100.00100011

     29           => 11111111.11111111.11111111.11111000
                     --------- logical AND -------------
                     11000001.00010000.00010100.00100000



**STEP 4:** The result is then converted back to the decimal format and this will be the network address.

`11000001.00010000.00010100.00100000 => 193.16.20.32`

Hence, the network IP is 193.16.20.32.

2. **CALCULATION OF NUMBER OF HOSTS**

 The Number of hosts in any network can be calculated with the formula:

  2^x - 2
  
  where **x** is the number of host ID bits in the IP address.
  
  **Why do we subtract 2?**
  This is because the first and last addresses are not used for any hosts because the first IP is used to represent the whole network ID while the last IP is used as the broadcast address.
  
   So for 193.16.20.35/29, the number of hosts will be calculted as follows:


     Maximum Number of hosts = 2^(32 - subnet) - 2

     Maximum Number of hosts = 2^(32 - 29) - 2

     Maximum Number of hosts = 6

3. **CALCULATION OF BROADCAST IP**

This is done using the following steps:
**STEP 1:** The given IP address is written in binary form.

` 193.16.20.35 => 11000001.00010000.00010100.00100011`

**STEP 2:** The inverse of the subnet mask is written in binary form or the host bits of the subnet value are converted to ones, and network bits are converted to zeros.

`29 => 11111111.11111111.11111111.11111000 => 00000000.00000000.00000000.00000111`

**STEP 4:** The **logical AND** operation is performed between the corresponding octets of the IP address and the inverse of the subnet mask.    

      193.16.20.35    => 11000001.00010000.00010100.00100011
     Inverse subnet  => 00000000.00000000.00000000.00000111
                         ----------- logical OR ------------
                         11000001.00010000.00010100.00100111


**STEP 4:** The result is then converted back to the decimal format and this will be the network address

`11000001.00010000.00010100.00100111 => 193.16.20.39`

Hence, the broadcast IP is 193.16.20.39

4. **RANGE OF IP ADDRESSES**

The range of IP addresses that can be assigned to hosts lie in between the value of the Network IP and the Broadcast IP i.e 193.16.20.32 - 193.16.20.39. These are as shown below:

     193.16.20.33
     193.16.20.34
     193.16.20.35
     193.16.20.36
     193.16.20.37
     193.16.20.38






  



