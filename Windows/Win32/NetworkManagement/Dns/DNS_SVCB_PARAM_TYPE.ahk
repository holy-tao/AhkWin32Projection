#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_SVCB_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: DnsSvcbParamMandatory
     * @type {Integer (Int32)}
     */
    static Mandatory => 0

    /**
     * Native name: DnsSvcbParamAlpn
     * @type {Integer (Int32)}
     */
    static Alpn => 1

    /**
     * Native name: DnsSvcbParamNoDefaultAlpn
     * @type {Integer (Int32)}
     */
    static NoDefaultAlpn => 2

    /**
     * Native name: DnsSvcbParamPort
     * @type {Integer (Int32)}
     */
    static Port => 3

    /**
     * Native name: DnsSvcbParamIpv4Hint
     * @type {Integer (Int32)}
     */
    static Ipv4Hint => 4

    /**
     * Native name: DnsSvcbParamEch
     * @type {Integer (Int32)}
     */
    static Ech => 5

    /**
     * Native name: DnsSvcbParamIpv6Hint
     * @type {Integer (Int32)}
     */
    static Ipv6Hint => 6

    /**
     * Native name: DnsSvcbParamDohPath
     * @type {Integer (Int32)}
     */
    static DohPath => 7

    /**
     * Native name: DnsSvcbParamDohPathOpenDns
     * @type {Integer (Int32)}
     */
    static DohPathOpenDns => 65432
}
