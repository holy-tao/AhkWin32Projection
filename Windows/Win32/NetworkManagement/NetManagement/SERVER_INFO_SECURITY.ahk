#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_SECURITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SV_SHARESECURITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SV_USERSECURITY => 1
}
