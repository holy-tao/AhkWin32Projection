#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the user interface (UI) elements of a math input control (MIC).
 * @remarks
 * This enumeration is used in custom painting.
 * @see https://learn.microsoft.com/windows/win32/api/micaut/ne-micaut-micuielement
 * @namespace Windows.Win32.UI.TabletPC
 */
class MICUIELEMENT extends Win32Enum {

    /**
     * The <b>Write</b> button.
     * Native name: MICUIELEMENT_BUTTON_WRITE
     * @type {Integer (Int32)}
     */
    static BUTTON_WRITE => 1

    /**
     * The <b>Erase</b> button.
     * Native name: MICUIELEMENT_BUTTON_ERASE
     * @type {Integer (Int32)}
     */
    static BUTTON_ERASE => 2

    /**
     * The <b>Select and Correct</b> button.
     * Native name: MICUIELEMENT_BUTTON_CORRECT
     * @type {Integer (Int32)}
     */
    static BUTTON_CORRECT => 4

    /**
     * The <b>Clear</b> button.
     * Native name: MICUIELEMENT_BUTTON_CLEAR
     * @type {Integer (Int32)}
     */
    static BUTTON_CLEAR => 8

    /**
     * The <b>Undo</b> button.
     * Native name: MICUIELEMENT_BUTTON_UNDO
     * @type {Integer (Int32)}
     */
    static BUTTON_UNDO => 16

    /**
     * The <b>Redo</b> button.
     * Native name: MICUIELEMENT_BUTTON_REDO
     * @type {Integer (Int32)}
     */
    static BUTTON_REDO => 32

    /**
     * The <b>Insert</b> button.
     * Native name: MICUIELEMENT_BUTTON_INSERT
     * @type {Integer (Int32)}
     */
    static BUTTON_INSERT => 64

    /**
     * The <b>Cancel</b> button.
     * Native name: MICUIELEMENT_BUTTON_CANCEL
     * @type {Integer (Int32)}
     */
    static BUTTON_CANCEL => 128

    /**
     * The writing-area background.
     * Native name: MICUIELEMENT_INKPANEL_BACKGROUND
     * @type {Integer (Int32)}
     */
    static INKPANEL_BACKGROUND => 256

    /**
     * The result preview-area background.
     * Native name: MICUIELEMENT_RESULTPANEL_BACKGROUND
     * @type {Integer (Int32)}
     */
    static RESULTPANEL_BACKGROUND => 512
}
