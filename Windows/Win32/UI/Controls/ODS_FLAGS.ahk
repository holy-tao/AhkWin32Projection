#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class ODS_FLAGS extends Win32Enum {

    /**
     * Native name: ODS_SELECTED
     * @type {Integer (UInt32)}
     */
    static SELECTED => 1

    /**
     * Native name: ODS_GRAYED
     * @type {Integer (UInt32)}
     */
    static GRAYED => 2

    /**
     * Native name: ODS_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 4

    /**
     * Native name: ODS_CHECKED
     * @type {Integer (UInt32)}
     */
    static CHECKED => 8

    /**
     * Native name: ODS_FOCUS
     * @type {Integer (UInt32)}
     */
    static FOCUS => 16

    /**
     * Native name: ODS_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 32

    /**
     * Native name: ODS_COMBOBOXEDIT
     * @type {Integer (UInt32)}
     */
    static COMBOBOXEDIT => 4096

    /**
     * Native name: ODS_HOTLIGHT
     * @type {Integer (UInt32)}
     */
    static HOTLIGHT => 64

    /**
     * Native name: ODS_INACTIVE
     * @type {Integer (UInt32)}
     */
    static INACTIVE => 128

    /**
     * Native name: ODS_NOACCEL
     * @type {Integer (UInt32)}
     */
    static NOACCEL => 256

    /**
     * Native name: ODS_NOFOCUSRECT
     * @type {Integer (UInt32)}
     */
    static NOFOCUSRECT => 512
}
