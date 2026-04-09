#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HEADERDROPDOWNSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HDDS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HDDS_SOFTHOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HDDS_HOT => 3
}
