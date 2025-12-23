#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the user interface (UI) elements of a math input control (MIC).
 * @remarks
 * This enumeration is used in custom painting.
 * @see https://learn.microsoft.com/windows/win32/api/micaut/ne-micaut-micuielement
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class MICUIELEMENT extends Win32Enum{

    /**
     * The <b>Write</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_WRITE => 1

    /**
     * The <b>Erase</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_ERASE => 2

    /**
     * The <b>Select and Correct</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_CORRECT => 4

    /**
     * The <b>Clear</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_CLEAR => 8

    /**
     * The <b>Undo</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_UNDO => 16

    /**
     * The <b>Redo</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_REDO => 32

    /**
     * The <b>Insert</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_INSERT => 64

    /**
     * The <b>Cancel</b> button.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_BUTTON_CANCEL => 128

    /**
     * The writing-area background.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_INKPANEL_BACKGROUND => 256

    /**
     * The result preview-area background.
     * @type {Integer (Int32)}
     */
    static MICUIELEMENT_RESULTPANEL_BACKGROUND => 512
}
