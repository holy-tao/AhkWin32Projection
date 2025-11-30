#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NPDIRECTORY_NOTIFY_OPERATION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WNDN_MKDIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNDN_RMDIR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNDN_MVDIR => 3
}
