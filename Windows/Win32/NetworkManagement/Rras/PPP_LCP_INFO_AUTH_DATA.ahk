#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class PPP_LCP_INFO_AUTH_DATA extends Win32Enum {

    /**
     * Native name: PPP_LCP_CHAP_MD5
     * @type {Integer (UInt32)}
     */
    static CHAP_MD5 => 5

    /**
     * Native name: PPP_LCP_CHAP_MS
     * @type {Integer (UInt32)}
     */
    static CHAP_MS => 128

    /**
     * Native name: PPP_LCP_CHAP_MSV2
     * @type {Integer (UInt32)}
     */
    static CHAP_MSV2 => 129
}
