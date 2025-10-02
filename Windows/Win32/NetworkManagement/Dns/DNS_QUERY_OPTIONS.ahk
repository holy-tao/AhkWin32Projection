#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_QUERY_OPTIONS{

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_PARSE_ALL_RECORDS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_STANDARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_ACCEPT_TRUNCATED_RESPONSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_USE_TCP_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_NO_RECURSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_BYPASS_CACHE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_NO_WIRE_QUERY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_NO_LOCAL_NAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_NO_HOSTS_FILE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_NO_NETBT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_WIRE_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_RETURN_MESSAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_MULTICAST_ONLY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_NO_MULTICAST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_TREAT_AS_FQDN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_ADDRCONFIG => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_DUAL_ADDR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_DONT_RESET_TTL_VALUES => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_DISABLE_IDN_ENCODING => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_APPEND_MULTILABEL => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_DNSSEC_OK => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_DNSSEC_CHECKING_DISABLED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_DNSSEC_REQUIRED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_RESERVED => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_CACHE_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_REQUEST_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_REQUEST_VERSION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_RESULTS_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_REQUEST_VERSION3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_RAW_RESULTS_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_RAW_REQUEST_VERSION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_QUERY_RAW_OPTION_BEST_EFFORT_PARSE => 1
}
