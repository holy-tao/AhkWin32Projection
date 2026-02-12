#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the set of user interface element types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.uielementtype
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class UIElementType extends Win32Enum{

    /**
     * An active caption element.
     * @type {Integer (Int32)}
     */
    static ActiveCaption => 0

    /**
     * A background element.
     * @type {Integer (Int32)}
     */
    static Background => 1

    /**
     * A button face element.
     * @type {Integer (Int32)}
     */
    static ButtonFace => 2

    /**
     * The text displayed on a button.
     * @type {Integer (Int32)}
     */
    static ButtonText => 3

    /**
     * The text displayed in a caption.
     * @type {Integer (Int32)}
     */
    static CaptionText => 4

    /**
     * Grayed text.
     * @type {Integer (Int32)}
     */
    static GrayText => 5

    /**
     * A highlighted user interface (UI) element.
     * @type {Integer (Int32)}
     */
    static Highlight => 6

    /**
     * Highlighted text.
     * @type {Integer (Int32)}
     */
    static HighlightText => 7

    /**
     * A hotlighted UI element.
     * @type {Integer (Int32)}
     */
    static Hotlight => 8

    /**
     * An inactive caption element.
     * @type {Integer (Int32)}
     */
    static InactiveCaption => 9

    /**
     * The text displayed in an inactive caption element.
     * @type {Integer (Int32)}
     */
    static InactiveCaptionText => 10

    /**
     * A window.
     * @type {Integer (Int32)}
     */
    static Window => 11

    /**
     * The text displayed in a window's UI decoration.
     * @type {Integer (Int32)}
     */
    static WindowText => 12

    /**
     * Windows accent color (Settings -> Personalization -> Colors -> Choose your accent color).
     * @type {Integer (Int32)}
     */
    static AccentColor => 1000

    /**
     * Text ink highlighter high color.
     * @type {Integer (Int32)}
     */
    static TextHigh => 1001

    /**
     * Text ink highlighter medium color.
     * @type {Integer (Int32)}
     */
    static TextMedium => 1002

    /**
     * Text ink highlighter low color.
     * @type {Integer (Int32)}
     */
    static TextLow => 1003

    /**
     * Text contrast with ink highlighter.
     * @type {Integer (Int32)}
     */
    static TextContrastWithHigh => 1004

    /**
     * Non-text ink highlighter high color.
     * @type {Integer (Int32)}
     */
    static NonTextHigh => 1005

    /**
     * Non-text ink highlighter medium-high color.
     * @type {Integer (Int32)}
     */
    static NonTextMediumHigh => 1006

    /**
     * Non-text ink highlighter medium color.
     * @type {Integer (Int32)}
     */
    static NonTextMedium => 1007

    /**
     * Non-text ink highlighter medium-low color.
     * @type {Integer (Int32)}
     */
    static NonTextMediumLow => 1008

    /**
     * Non-text ink highlighter low color.
     * @type {Integer (Int32)}
     */
    static NonTextLow => 1009

    /**
     * Page background.
     * @type {Integer (Int32)}
     */
    static PageBackground => 1010

    /**
     * Popup background.
     * @type {Integer (Int32)}
     */
    static PopupBackground => 1011

    /**
     * Popup outside overlay.
     * @type {Integer (Int32)}
     */
    static OverlayOutsidePopup => 1012
}
