#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies various ink editor states.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-dispid_inkedit
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkEdit extends Win32Enum {

    /**
     * Text.
     * Native name: DISPID_Text
     * @type {Integer (Int32)}
     */
    static Text => 0

    /**
     * Text, including all RTF (Rich Text Format) codes.
     * Native name: DISPID_TextRTF
     * @type {Integer (Int32)}
     */
    static TextRTF => 1

    /**
     * Handle.
     * Native name: DISPID_Hwnd
     * @type {Integer (Int32)}
     */
    static Hwnd => 2

    /**
     * Scroll disabled.
     * Native name: DISPID_DisableNoScroll
     * @type {Integer (Int32)}
     */
    static DisableNoScroll => 3

    /**
     * Locked.
     * Native name: DISPID_Locked
     * @type {Integer (Int32)}
     */
    static Locked => 4

    /**
     * Enabled.
     * Native name: DISPID_Enabled
     * @type {Integer (Int32)}
     */
    static Enabled => 5

    /**
     * Maximum number of characters an InkEdit control can hold.
     * Native name: DISPID_MaxLength
     * @type {Integer (Int32)}
     */
    static MaxLength => 6

    /**
     * Multiline.
     * Native name: DISPID_MultiLine
     * @type {Integer (Int32)}
     */
    static MultiLine => 7

    /**
     * Scroll bars.
     * Native name: DISPID_ScrollBars
     * @type {Integer (Int32)}
     */
    static ScrollBars => 8

    /**
     * Starting point of the selected text.
     * Native name: DISPID_RTSelStart
     * @type {Integer (Int32)}
     */
    static RTSelStart => 9

    /**
     * Selected text length.
     * Native name: DISPID_RTSelLength
     * @type {Integer (Int32)}
     */
    static RTSelLength => 10

    /**
     * Selected text.
     * Native name: DISPID_RTSelText
     * @type {Integer (Int32)}
     */
    static RTSelText => 11

    /**
     * Selected text alignment.
     * Native name: DISPID_SelAlignment
     * @type {Integer (Int32)}
     */
    static SelAlignment => 12

    /**
     * Selected text bold.
     * Native name: DISPID_SelBold
     * @type {Integer (Int32)}
     */
    static SelBold => 13

    /**
     * Selected text appears on the baseline (normal), as a superscript above the baseline, or as a subscript below the baseline.
     * Native name: DISPID_SelCharOffset
     * @type {Integer (Int32)}
     */
    static SelCharOffset => 14

    /**
     * Text selection highlight color.
     * Native name: DISPID_SelColor
     * @type {Integer (Int32)}
     */
    static SelColor => 15

    /**
     * Text selection font name.
     * Native name: DISPID_SelFontName
     * @type {Integer (Int32)}
     */
    static SelFontName => 16

    /**
     * Text selection font size.
     * Native name: DISPID_SelFontSize
     * @type {Integer (Int32)}
     */
    static SelFontSize => 17

    /**
     * Text selection italicized.
     * Native name: DISPID_SelItalic
     * @type {Integer (Int32)}
     */
    static SelItalic => 18

    /**
     * Text selection is RTF.
     * Native name: DISPID_SelRTF
     * @type {Integer (Int32)}
     */
    static SelRTF => 19

    /**
     * Text selection underlined.
     * Native name: DISPID_SelUnderline
     * @type {Integer (Int32)}
     */
    static SelUnderline => 20

    /**
     * Drag icon.
     * Native name: DISPID_DragIcon
     * @type {Integer (Int32)}
     */
    static DragIcon => 21

    /**
     * Status.
     * Native name: DISPID_Status
     * @type {Integer (Int32)}
     */
    static Status => 22

    /**
     * Mouse inking.
     * Native name: DISPID_UseMouseForInput
     * @type {Integer (Int32)}
     */
    static UseMouseForInput => 23

    /**
     * Ink collection is disabled, ink is collected, or ink and gestures are collected.
     * Native name: DISPID_InkMode
     * @type {Integer (Int32)}
     */
    static Mode => 24

    /**
     * Ink is inserted as either text or ink.
     * Native name: DISPID_InkInsertMode
     * @type {Integer (Int32)}
     */
    static InsertMode => 25

    /**
     * Length of time, in milliseconds, between the last IInkStrokeDisp object collected and the beginning of text recognition.
     * Native name: DISPID_RecoTimeout
     * @type {Integer (Int32)}
     */
    static RecoTimeout => 26

    /**
     * Ink drawing attributes.
     * Native name: DISPID_DrawAttr
     * @type {Integer (Int32)}
     */
    static DrawAttr => 27

    /**
     * Recognizer enabled.
     * Native name: DISPID_Recognizer
     * @type {Integer (Int32)}
     */
    static Recognizer => 28

    /**
     * [Factoid](/windows/win32/tablet/factoid-constants) constant used to constrain recognition results.
     * Native name: DISPID_Factoid
     * @type {Integer (Int32)}
     */
    static Factoid => 29

    /**
     * Ink selection.
     * Native name: DISPID_SelInk
     * @type {Integer (Int32)}
     */
    static SelInk => 30

    /**
     * Text selection displayed as ink or text.
     * Native name: DISPID_SelInksDisplayMode
     * @type {Integer (Int32)}
     */
    static SelInksDisplayMode => 31

    /**
     * Recognition active.
     * Native name: DISPID_Recognize
     * @type {Integer (Int32)}
     */
    static Recognize => 32

    /**
     * Getting gesture recognition status.
     * Native name: DISPID_GetGestStatus
     * @type {Integer (Int32)}
     */
    static GetGestStatus => 33

    /**
     * Setting gesture recognition status.
     * Native name: DISPID_SetGestStatus
     * @type {Integer (Int32)}
     */
    static SetGestStatus => 34

    /**
     * Redraw.
     * Native name: DISPID_Refresh
     * @type {Integer (Int32)}
     */
    static Refresh => 35
}
