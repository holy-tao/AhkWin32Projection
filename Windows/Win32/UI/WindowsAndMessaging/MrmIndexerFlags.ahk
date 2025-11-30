#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MrmIndexerFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MrmIndexerFlagsNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MrmIndexerFlagsAutoMerge => 1

    /**
     * @type {Integer (Int32)}
     */
    static MrmIndexerFlagsCreateContentChecksum => 2
}
