#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HEADERDROPDOWNFILTERSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HDDFS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HDDFS_SOFTHOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HDDFS_HOT => 3
}
