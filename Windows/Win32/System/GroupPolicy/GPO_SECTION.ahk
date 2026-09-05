#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
class GPO_SECTION extends Win32Enum {

    /**
     * Native name: GPO_SECTION_ROOT
     * @type {Integer (UInt32)}
     */
    static ROOT => 0

    /**
     * Native name: GPO_SECTION_USER
     * @type {Integer (UInt32)}
     */
    static USER => 1

    /**
     * Native name: GPO_SECTION_MACHINE
     * @type {Integer (UInt32)}
     */
    static MACHINE => 2
}
