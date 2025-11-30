#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_PAP => 49187

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_SPAP => 49191

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_CHAP => 49699

    /**
     * @type {Integer (UInt32)}
     */
    static RASLCPAP_EAP => 49703
}
