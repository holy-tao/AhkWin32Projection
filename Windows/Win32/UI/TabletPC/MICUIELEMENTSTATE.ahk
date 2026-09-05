#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the button states of a math input control (MIC).
 * @remarks
 * This enumeration is used in custom painting.
 * @see https://learn.microsoft.com/windows/win32/api/micaut/ne-micaut-micuielementstate
 * @namespace Windows.Win32.UI.TabletPC
 */
class MICUIELEMENTSTATE extends Win32Enum {

    /**
     * The button does not have the mouse hovering over it.
     * Native name: MICUIELEMENTSTATE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1

    /**
     * The button has the mouse hovering over it.
     * Native name: MICUIELEMENTSTATE_HOT
     * @type {Integer (Int32)}
     */
    static HOT => 2

    /**
     * The button is pressed.
     * Native name: MICUIELEMENTSTATE_PRESSED
     * @type {Integer (Int32)}
     */
    static PRESSED => 3

    /**
     * The button is disabled.
     * Native name: MICUIELEMENTSTATE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 4
}
