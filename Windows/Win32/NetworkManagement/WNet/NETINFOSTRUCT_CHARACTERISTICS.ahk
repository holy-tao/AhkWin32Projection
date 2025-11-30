#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NETINFOSTRUCT_CHARACTERISTICS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static NETINFO_DLL16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETINFO_DISKRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETINFO_PRINTERRED => 8
}
