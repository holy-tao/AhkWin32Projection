#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PAGEACTION_UI extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_MODAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_MODELESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static PAGEACTION_UI_SILENT => 3
}
