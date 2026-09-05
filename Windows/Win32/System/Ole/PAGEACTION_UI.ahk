#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class PAGEACTION_UI extends Win32Enum {

    /**
     * Native name: PAGEACTION_UI_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: PAGEACTION_UI_MODAL
     * @type {Integer (Int32)}
     */
    static MODAL => 1

    /**
     * Native name: PAGEACTION_UI_MODELESS
     * @type {Integer (Int32)}
     */
    static MODELESS => 2

    /**
     * Native name: PAGEACTION_UI_SILENT
     * @type {Integer (Int32)}
     */
    static SILENT => 3
}
