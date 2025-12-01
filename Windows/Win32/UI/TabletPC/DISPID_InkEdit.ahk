#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies various ink editor states.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-dispid_inkedit
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkEdit extends Win32Enum{

    /**
     * Text.
     * @type {Integer (Int32)}
     */
    static DISPID_Text => 0

    /**
     * Text, including all RTF (Rich Text Format) codes.
     * @type {Integer (Int32)}
     */
    static DISPID_TextRTF => 1

    /**
     * Handle.
     * @type {Integer (Int32)}
     */
    static DISPID_Hwnd => 2

    /**
     * Scroll disabled.
     * @type {Integer (Int32)}
     */
    static DISPID_DisableNoScroll => 3

    /**
     * Locked.
     * @type {Integer (Int32)}
     */
    static DISPID_Locked => 4

    /**
     * Enabled.
     * @type {Integer (Int32)}
     */
    static DISPID_Enabled => 5

    /**
     * Maximum number of characters an InkEdit control can hold.
     * @type {Integer (Int32)}
     */
    static DISPID_MaxLength => 6

    /**
     * Multiline.
     * @type {Integer (Int32)}
     */
    static DISPID_MultiLine => 7

    /**
     * Scroll bars.
     * @type {Integer (Int32)}
     */
    static DISPID_ScrollBars => 8

    /**
     * Starting point of the selected text.
     * @type {Integer (Int32)}
     */
    static DISPID_RTSelStart => 9

    /**
     * Selected text length.
     * @type {Integer (Int32)}
     */
    static DISPID_RTSelLength => 10

    /**
     * Selected text.
     * @type {Integer (Int32)}
     */
    static DISPID_RTSelText => 11

    /**
     * Selected text alignment.
     * @type {Integer (Int32)}
     */
    static DISPID_SelAlignment => 12

    /**
     * Selected text bold.
     * @type {Integer (Int32)}
     */
    static DISPID_SelBold => 13

    /**
     * Selected text appears on the baseline (normal), as a superscript above the baseline, or as a subscript below the baseline.
     * @type {Integer (Int32)}
     */
    static DISPID_SelCharOffset => 14

    /**
     * Text selection highlight color.
     * @type {Integer (Int32)}
     */
    static DISPID_SelColor => 15

    /**
     * Text selection font name.
     * @type {Integer (Int32)}
     */
    static DISPID_SelFontName => 16

    /**
     * Text selection font size.
     * @type {Integer (Int32)}
     */
    static DISPID_SelFontSize => 17

    /**
     * Text selection italicized.
     * @type {Integer (Int32)}
     */
    static DISPID_SelItalic => 18

    /**
     * Text selection is RTF.
     * @type {Integer (Int32)}
     */
    static DISPID_SelRTF => 19

    /**
     * Text selection underlined.
     * @type {Integer (Int32)}
     */
    static DISPID_SelUnderline => 20

    /**
     * Drag icon.
     * @type {Integer (Int32)}
     */
    static DISPID_DragIcon => 21

    /**
     * Status.
     * @type {Integer (Int32)}
     */
    static DISPID_Status => 22

    /**
     * Mouse inking.
     * @type {Integer (Int32)}
     */
    static DISPID_UseMouseForInput => 23

    /**
     * Ink collection is disabled, ink is collected, or ink and gestures are collected.
     * @type {Integer (Int32)}
     */
    static DISPID_InkMode => 24

    /**
     * Ink is inserted as either text or ink.
     * @type {Integer (Int32)}
     */
    static DISPID_InkInsertMode => 25

    /**
     * Length of time, in milliseconds, between the last IInkStrokeDisp object collected and the beginning of text recognition.
     * @type {Integer (Int32)}
     */
    static DISPID_RecoTimeout => 26

    /**
     * Ink drawing attributes.
     * @type {Integer (Int32)}
     */
    static DISPID_DrawAttr => 27

    /**
     * Recognizer enabled.
     * @type {Integer (Int32)}
     */
    static DISPID_Recognizer => 28

    /**
     * [Factoid](/windows/win32/tablet/factoid-constants) constant used to constrain recognition results.
     * @type {Integer (Int32)}
     */
    static DISPID_Factoid => 29

    /**
     * Ink selection.
     * @type {Integer (Int32)}
     */
    static DISPID_SelInk => 30

    /**
     * Text selection displayed as ink or text.
     * @type {Integer (Int32)}
     */
    static DISPID_SelInksDisplayMode => 31

    /**
     * Recognition active.
     * @type {Integer (Int32)}
     */
    static DISPID_Recognize => 32

    /**
     * Getting gesture recognition status.
     * @type {Integer (Int32)}
     */
    static DISPID_GetGestStatus => 33

    /**
     * Setting gesture recognition status.
     * @type {Integer (Int32)}
     */
    static DISPID_SetGestStatus => 34

    /**
     * Redraw.
     * @type {Integer (Int32)}
     */
    static DISPID_Refresh => 35
}
