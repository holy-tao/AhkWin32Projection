#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class UNC_INFO_LEVEL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static UNIVERSAL_NAME_INFO_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REMOTE_NAME_INFO_LEVEL => 2
}
