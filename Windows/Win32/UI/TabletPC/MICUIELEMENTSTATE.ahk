#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the button states of a math input control (MIC).
 * @remarks
 * 
 * This enumeration is used in custom painting.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//micaut/ne-micaut-micuielementstate
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class MICUIELEMENTSTATE extends Win32Enum{

    /**
     * The button does not have the mouse hovering over it.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENTSTATE_NORMAL => 1

    /**
     * The button has the mouse hovering over it.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENTSTATE_HOT => 2

    /**
     * The button is pressed.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENTSTATE_PRESSED => 3

    /**
     * The button is disabled.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENTSTATE_DISABLED => 4
}
