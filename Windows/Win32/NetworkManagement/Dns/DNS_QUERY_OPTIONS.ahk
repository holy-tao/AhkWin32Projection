#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_QUERY_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: DNS_QUERY_PARSE_ALL_RECORDS
     * @type {Integer (UInt32)}
     */
    static PARSE_ALL_RECORDS => 0

    /**
     * Native name: DNS_QUERY_STANDARD
     * @type {Integer (UInt32)}
     */
    static STANDARD => 0

    /**
     * Native name: DNS_QUERY_ACCEPT_TRUNCATED_RESPONSE
     * @type {Integer (UInt32)}
     */
    static ACCEPT_TRUNCATED_RESPONSE => 1

    /**
     * Native name: DNS_QUERY_USE_TCP_ONLY
     * @type {Integer (UInt32)}
     */
    static USE_TCP_ONLY => 2

    /**
     * Native name: DNS_QUERY_NO_RECURSION
     * @type {Integer (UInt32)}
     */
    static NO_RECURSION => 4

    /**
     * Native name: DNS_QUERY_BYPASS_CACHE
     * @type {Integer (UInt32)}
     */
    static BYPASS_CACHE => 8

    /**
     * Native name: DNS_QUERY_NO_WIRE_QUERY
     * @type {Integer (UInt32)}
     */
    static NO_WIRE_QUERY => 16

    /**
     * Native name: DNS_QUERY_NO_LOCAL_NAME
     * @type {Integer (UInt32)}
     */
    static NO_LOCAL_NAME => 32

    /**
     * Native name: DNS_QUERY_NO_HOSTS_FILE
     * @type {Integer (UInt32)}
     */
    static NO_HOSTS_FILE => 64

    /**
     * Native name: DNS_QUERY_NO_NETBT
     * @type {Integer (UInt32)}
     */
    static NO_NETBT => 128

    /**
     * Native name: DNS_QUERY_WIRE_ONLY
     * @type {Integer (UInt32)}
     */
    static WIRE_ONLY => 256

    /**
     * Native name: DNS_QUERY_RETURN_MESSAGE
     * @type {Integer (UInt32)}
     */
    static RETURN_MESSAGE => 512

    /**
     * Native name: DNS_QUERY_MULTICAST_ONLY
     * @type {Integer (UInt32)}
     */
    static MULTICAST_ONLY => 1024

    /**
     * Native name: DNS_QUERY_NO_MULTICAST
     * @type {Integer (UInt32)}
     */
    static NO_MULTICAST => 2048

    /**
     * Native name: DNS_QUERY_TREAT_AS_FQDN
     * @type {Integer (UInt32)}
     */
    static TREAT_AS_FQDN => 4096

    /**
     * Native name: DNS_QUERY_ADDRCONFIG
     * @type {Integer (UInt32)}
     */
    static ADDRCONFIG => 8192

    /**
     * Native name: DNS_QUERY_DUAL_ADDR
     * @type {Integer (UInt32)}
     */
    static DUAL_ADDR => 16384

    /**
     * Native name: DNS_QUERY_DONT_RESET_TTL_VALUES
     * @type {Integer (UInt32)}
     */
    static DONT_RESET_TTL_VALUES => 1048576

    /**
     * Native name: DNS_QUERY_DISABLE_IDN_ENCODING
     * @type {Integer (UInt32)}
     */
    static DISABLE_IDN_ENCODING => 2097152

    /**
     * Native name: DNS_QUERY_APPEND_MULTILABEL
     * @type {Integer (UInt32)}
     */
    static APPEND_MULTILABEL => 8388608

    /**
     * Native name: DNS_QUERY_DNSSEC_OK
     * @type {Integer (UInt32)}
     */
    static DNSSEC_OK => 16777216

    /**
     * Native name: DNS_QUERY_DNSSEC_CHECKING_DISABLED
     * @type {Integer (UInt32)}
     */
    static DNSSEC_CHECKING_DISABLED => 33554432

    /**
     * Native name: DNS_QUERY_DNSSEC_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DNSSEC_REQUIRED => 67108864

    /**
     * Native name: DNS_QUERY_RESERVED
     * @type {Integer (UInt32)}
     */
    static RESERVED => 4026531840

    /**
     * Native name: DNS_QUERY_CACHE_ONLY
     * @type {Integer (UInt32)}
     */
    static CACHE_ONLY => 16

    /**
     * Native name: DNS_QUERY_REQUEST_VERSION1
     * @type {Integer (UInt32)}
     */
    static REQUEST_VERSION1 => 1

    /**
     * Native name: DNS_QUERY_REQUEST_VERSION2
     * @type {Integer (UInt32)}
     */
    static REQUEST_VERSION2 => 2

    /**
     * Native name: DNS_QUERY_RESULTS_VERSION1
     * @type {Integer (UInt32)}
     */
    static RESULTS_VERSION1 => 1

    /**
     * Native name: DNS_QUERY_REQUEST_VERSION3
     * @type {Integer (UInt32)}
     */
    static REQUEST_VERSION3 => 3

    /**
     * Native name: DNS_QUERY_RAW_RESULTS_VERSION1
     * @type {Integer (UInt32)}
     */
    static RAW_RESULTS_VERSION1 => 1

    /**
     * Native name: DNS_QUERY_RAW_REQUEST_VERSION1
     * @type {Integer (UInt32)}
     */
    static RAW_REQUEST_VERSION1 => 1

    /**
     * Native name: DNS_QUERY_RAW_OPTION_BEST_EFFORT_PARSE
     * @type {Integer (UInt32)}
     */
    static RAW_OPTION_BEST_EFFORT_PARSE => 1
}
