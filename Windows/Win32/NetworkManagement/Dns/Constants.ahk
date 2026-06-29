#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global SIZEOF_IP4_ADDRESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IP4_ADDRESS_STRING_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global IP4_ADDRESS_STRING_BUFFER_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ADDR_MAX_SOCKADDR_LENGTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_ZERO := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_A := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MD := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MF := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_CNAME := 5

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_SOA := 6

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MB := 7

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MG := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MR := 9

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NULL := 10

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_WKS := 11

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_PTR := 12

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_HINFO := 13

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MINFO := 14

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MX := 15

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_TEXT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_RP := 17

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_AFSDB := 18

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_X25 := 19

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_ISDN := 20

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_RT := 21

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NSAP := 22

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NSAPPTR := 23

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_SIG := 24

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_KEY := 25

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_PX := 26

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_GPOS := 27

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_AAAA := 28

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_LOC := 29

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NXT := 30

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_EID := 31

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NIMLOC := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_SRV := 33

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_ATMA := 34

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NAPTR := 35

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_KX := 36

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_CERT := 37

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_A6 := 38

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_DNAME := 39

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_SINK := 40

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_OPT := 41

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_DS := 43

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_RRSIG := 46

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NSEC := 47

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_DNSKEY := 48

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_DHCID := 49

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NSEC3 := 50

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NSEC3PARAM := 51

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_TLSA := 52

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_SVCB := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_HTTPS := 65

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_UINFO := 100

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_UID := 101

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_GID := 102

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_UNSPEC := 103

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_ADDRS := 248

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_TKEY := 249

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_TSIG := 250

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_IXFR := 251

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_AXFR := 252

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MAILB := 253

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_MAILA := 254

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_ALL := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_ANY := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_WINS := 65281

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_WINSR := 65282

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TYPE_NBSTAT := 65282

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_A := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NS := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MD := 768

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MF := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_CNAME := 1280

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_SOA := 1536

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MB := 1792

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MG := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MR := 2304

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NULL := 2560

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_WKS := 2816

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_PTR := 3072

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_HINFO := 3328

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MINFO := 3584

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MX := 3840

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_TEXT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_RP := 4352

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_AFSDB := 4608

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_X25 := 4864

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_ISDN := 5120

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_RT := 5376

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NSAP := 5632

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NSAPPTR := 5888

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_SIG := 6144

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_KEY := 6400

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_PX := 6656

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_GPOS := 6912

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_AAAA := 7168

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_LOC := 7424

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NXT := 7680

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_EID := 7936

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NIMLOC := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_SRV := 8448

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_ATMA := 8704

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NAPTR := 8960

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_KX := 9216

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_CERT := 9472

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_A6 := 9728

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_DNAME := 9984

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_SINK := 10240

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_OPT := 10496

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_DS := 11008

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_RRSIG := 11776

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NSEC := 12032

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_DNSKEY := 12288

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_DHCID := 12544

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NSEC3 := 12800

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_NSEC3PARAM := 13056

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_TLSA := 13312

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_UINFO := 25600

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_UID := 25856

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_GID := 26112

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_UNSPEC := 26368

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_TKEY := 63744

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_TSIG := 64000

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_IXFR := 64256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_AXFR := 64512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MAILB := 64768

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_MAILA := 65024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_ALL := 65280

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_ANY := 65280

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_WINS := 511

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RTYPE_WINSR := 767

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ATMA_FORMAT_E164 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ATMA_FORMAT_AESA := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ATMA_MAX_ADDR_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ATMA_AESA_ADDR_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ATMA_MAX_RECORD_LENGTH := 21

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_RSAMD5 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_RSASHA1 := 5

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_RSASHA1_NSEC3 := 7

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_RSASHA256 := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_RSASHA512 := 10

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_ECDSAP256_SHA256 := 13

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_ECDSAP384_SHA384 := 14

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_NULL := 253

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_ALGORITHM_PRIVATE := 254

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_DIGEST_ALGORITHM_SHA1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_DIGEST_ALGORITHM_SHA256 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_DIGEST_ALGORITHM_SHA384 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_PROTOCOL_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_PROTOCOL_TLS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_PROTOCOL_EMAIL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_PROTOCOL_DNSSEC := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_PROTOCOL_IPSEC := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_NOAUTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_NOCONF := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_EXTEND := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG4 := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG5 := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_USER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_ZONE := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_HOST := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_NTPE3 := 192

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG8 := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG9 := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG10 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_FLAG11 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG0 := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG1 := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG2 := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG3 := 12288

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG4 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG5 := 20480

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG6 := 24576

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG7 := 28672

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG8 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG9 := 36864

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG10 := 40960

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG11 := 45056

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG12 := 49152

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG13 := 53248

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG14 := 57344

/**
 * @type {Integer (UInt32)}
 */
export global DNSSEC_KEY_FLAG_SIG15 := 61440

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TKEY_MODE_SERVER_ASSIGN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TKEY_MODE_DIFFIE_HELLMAN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TKEY_MODE_GSS := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_TKEY_MODE_RESOLVER_ASSIGN := 4

/**
 * @type {Integer (UInt32)}
 */
export global DDR_MAX_IP_HINTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_SECTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_QUESTION := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_ANSWER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_AUTHORITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_ADDITIONAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_ZONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_PREREQ := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_UPDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_DELETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNSREC_NOEXIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RFC_MAX_UDP_PACKET_LENGTH := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_NAME_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_LABEL_LENGTH := 63

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_NAME_BUFFER_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_LABEL_BUFFER_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CUSTOM_SERVER_TYPE_UDP := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CUSTOM_SERVER_TYPE_DOH := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CUSTOM_SERVER_TYPE_DOT := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CUSTOM_SERVER_UDP_FALLBACK := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CUSTOM_SERVER_UPGRADE_FROM_WELL_KNOWN_SERVERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global IP6_ADDRESS_STRING_LENGTH := 65

/**
 * @type {Integer (UInt32)}
 */
export global IP6_ADDRESS_STRING_BUFFER_LENGTH := 65

/**
 * @type {Integer (UInt32)}
 */
export global DNS_ADDRESS_STRING_LENGTH := 65

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PORT_HOST_ORDER := 53

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PORT_NET_ORDER := 13568

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_DEFAULT_DNS_PORT := 53

/**
 * @type {Integer (UInt32)}
 */
export global INTERNET_DEFAULT_DOT_PORT := 853

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_IP4_REVERSE_NAME_LENGTH := 31

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_IP6_REVERSE_NAME_LENGTH := 75

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_REVERSE_NAME_LENGTH := 75

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_IP4_REVERSE_NAME_BUFFER_LENGTH := 31

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_IP6_REVERSE_NAME_BUFFER_LENGTH := 75

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_REVERSE_NAME_BUFFER_LENGTH := 75

/**
 * @type {Integer (UInt32)}
 */
export global DNS_MAX_TEXT_STRING_LENGTH := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_COMPRESSED_QUESTION_NAME := 49164

/**
 * @type {Integer (UInt32)}
 */
export global DNS_OPCODE_QUERY := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_OPCODE_IQUERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_OPCODE_SERVER_STATUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_OPCODE_UNKNOWN := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_OPCODE_NOTIFY := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_OPCODE_UPDATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NOERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_FORMERR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_SERVFAIL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NXDOMAIN := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NOTIMPL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_REFUSED := 5

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_YXDOMAIN := 6

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_YXRRSET := 7

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NXRRSET := 8

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NOTAUTH := 9

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NOTZONE := 10

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_MAX := 15

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_BADVERS := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_BADSIG := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_BADKEY := 17

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_BADTIME := 18

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NO_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_FORMAT_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_SERVER_FAILURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NAME_ERROR := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCODE_NOT_IMPLEMENTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_INTERNET := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_CSNET := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_CHAOS := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_HESIOD := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_NONE := 254

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_ALL := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_ANY := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CLASS_UNICAST_RESPONSE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_INTERNET := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_CSNET := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_CHAOS := 768

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_HESIOD := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_NONE := 65024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_ALL := 65280

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_ANY := 65280

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_UNICAST_RESPONSE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNS_RCLASS_MDNS_CACHE_FLUSH := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNS_WINS_FLAG_SCOPE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DNS_WINS_FLAG_LOCAL := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONFIG_FLAG_ALLOC := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_APP_SETTINGS_VERSION1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_APP_SETTINGS_EXCLUSIVE_SERVERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PROTOCOL_UNSPECIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PROTOCOL_UDP := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PROTOCOL_TCP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PROTOCOL_DOH := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PROTOCOL_DOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_PROTOCOL_NO_WIRE := 5

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_SECURITY_USE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_SECURITY_OFF := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_SECURITY_ON := 32

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_SECURITY_ONLY := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_CACHE_SECURITY_CONTEXT := 512

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_TEST_USE_LOCAL_SYS_ACCT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_FORCE_SECURITY_NEGO := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_TRY_ALL_MASTER_SERVERS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_SKIP_NO_UPDATE_ADAPTERS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_REMOTE_SERVER := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DNS_UPDATE_RESERVED := 4294901760

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_INVALID_ADDR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_INVALID_NAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_UNREACHABLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_NO_RESPONSE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_NO_AUTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_REFUSED := 6

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_NO_TCP := 16

/**
 * @type {Integer (UInt32)}
 */
export global DNS_VALSVR_ERROR_UNKNOWN := 255

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_NAME_MAX_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_CURRENT_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_SERVER_MAX_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_FRIENDLY_NAME_MAX_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_USERNAME_MAX_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_PASSWORD_MAX_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_EXCEPTION_MAX_LENGTH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_EXTRA_INFO_MAX_LENGTH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_FLAG_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_PROXY_INFO_FLAG_BYPASSLOCAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DNS_CONNECTION_POLICY_ENTRY_ONDEMAND := 1
;@endregion Constants
