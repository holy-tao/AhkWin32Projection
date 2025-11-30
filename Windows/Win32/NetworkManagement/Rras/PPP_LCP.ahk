#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_LCP extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_PAP => 49187

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_CHAP => 49699

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_EAP => 49703

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_SPAP => 49191
}
