#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class MERGE_UPDATE_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MUS_COMPLETE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MUS_USERINPUTNEEDED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MUS_FAILED => 2
}
