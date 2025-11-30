#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class ICS_TARGETTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ICSTT_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICSTT_IPADDRESS => 1
}
