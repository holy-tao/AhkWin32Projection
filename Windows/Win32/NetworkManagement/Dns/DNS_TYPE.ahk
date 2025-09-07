#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_TYPE{

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_ZERO => 0

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_A => 1

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NS => 2

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MD => 3

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MF => 4

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_CNAME => 5

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_SOA => 6

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MB => 7

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MG => 8

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MR => 9

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NULL => 10

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_WKS => 11

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_PTR => 12

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_HINFO => 13

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MINFO => 14

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MX => 15

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_TEXT => 16

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_RP => 17

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_AFSDB => 18

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_X25 => 19

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_ISDN => 20

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_RT => 21

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NSAP => 22

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NSAPPTR => 23

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_SIG => 24

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_KEY => 25

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_PX => 26

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_GPOS => 27

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_AAAA => 28

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_LOC => 29

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NXT => 30

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_EID => 31

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NIMLOC => 32

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_SRV => 33

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_ATMA => 34

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NAPTR => 35

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_KX => 36

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_CERT => 37

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_A6 => 38

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_DNAME => 39

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_SINK => 40

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_OPT => 41

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_DS => 43

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_RRSIG => 46

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NSEC => 47

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_DNSKEY => 48

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_DHCID => 49

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NSEC3 => 50

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NSEC3PARAM => 51

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_TLSA => 52

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_SVCB => 64

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_HTTPS => 65

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_UINFO => 100

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_UID => 101

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_GID => 102

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_UNSPEC => 103

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_ADDRS => 248

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_TKEY => 249

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_TSIG => 250

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_IXFR => 251

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_AXFR => 252

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MAILB => 253

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_MAILA => 254

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_ALL => 255

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_ANY => 255

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_WINS => 65281

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_WINSR => 65282

    /**
     * @type {Integer (UInt16)}
     */
    static DNS_TYPE_NBSTAT => 65282
}
