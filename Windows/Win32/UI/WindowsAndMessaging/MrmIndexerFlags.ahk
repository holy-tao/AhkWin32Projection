#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class MrmIndexerFlags extends Win32Enum {

    /**
     * Native name: MrmIndexerFlagsNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: MrmIndexerFlagsAutoMerge
     * @type {Integer (Int32)}
     */
    static AutoMerge => 1

    /**
     * Native name: MrmIndexerFlagsCreateContentChecksum
     * @type {Integer (Int32)}
     */
    static CreateContentChecksum => 2
}
