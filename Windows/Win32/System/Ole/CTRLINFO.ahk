#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class CTRLINFO extends Win32Enum {

    /**
     * Native name: CTRLINFO_EATS_RETURN
     * @type {Integer (Int32)}
     */
    static EATS_RETURN => 1

    /**
     * Native name: CTRLINFO_EATS_ESCAPE
     * @type {Integer (Int32)}
     */
    static EATS_ESCAPE => 2
}
