#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class WNET_OPEN_ENUM_USAGE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_CONNECTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_CONTAINER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_ATTACHED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_ALL => 19
}
