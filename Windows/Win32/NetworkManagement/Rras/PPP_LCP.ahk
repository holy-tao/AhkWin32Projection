#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class PPP_LCP extends Win32Enum {

    /**
     * Native name: PPP_LCP_PAP
     * @type {Integer (UInt32)}
     */
    static PAP => 49187

    /**
     * Native name: PPP_LCP_CHAP
     * @type {Integer (UInt32)}
     */
    static CHAP => 49699

    /**
     * Native name: PPP_LCP_EAP
     * @type {Integer (UInt32)}
     */
    static EAP => 49703

    /**
     * Native name: PPP_LCP_SPAP
     * @type {Integer (UInt32)}
     */
    static SPAP => 49191
}
