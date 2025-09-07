#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SVCB_PARAM_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamMandatory => 0

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamAlpn => 1

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamNoDefaultAlpn => 2

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamPort => 3

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamIpv4Hint => 4

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamEch => 5

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamIpv6Hint => 6

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamDohPath => 7

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamDohPathQuad9 => 65380

    /**
     * @type {Integer (Int32)}
     */
    static DnsSvcbParamDohPathOpenDns => 65432
}
