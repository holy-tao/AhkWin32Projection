#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ENUM_CONTROLS_WHICH_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GCW_WCH_SIBLING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_CONTAINER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_CONTAINED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_ALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FREVERSEDIR => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FONLYAFTER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FONLYBEFORE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FSELECTED => 1073741824
}
