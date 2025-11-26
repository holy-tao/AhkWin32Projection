#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkRecognizer.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Ole\OLE_HANDLE.ahk
#Include ..\..\System\Ole\IFontDisp.ahk
#Include ..\..\System\Ole\IPictureDisp.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//inked/nn-inked-iinkedit
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkEdit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkEdit
     * @type {Guid}
     */
    static IID => Guid("{f2127a19-fbfb-4aed-8464-3f36d78cfefb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_UseMouseForInput", "put_UseMouseForInput", "get_InkMode", "put_InkMode", "get_InkInsertMode", "put_InkInsertMode", "get_DrawingAttributes", "putref_DrawingAttributes", "get_RecognitionTimeout", "put_RecognitionTimeout", "get_Recognizer", "putref_Recognizer", "get_Factoid", "put_Factoid", "get_SelInks", "put_SelInks", "get_SelInksDisplayMode", "put_SelInksDisplayMode", "Recognize", "GetGestureStatus", "SetGestureStatus", "put_BackColor", "get_BackColor", "get_Appearance", "put_Appearance", "get_BorderStyle", "put_BorderStyle", "get_Hwnd", "get_Font", "putref_Font", "get_Text", "put_Text", "get_MouseIcon", "put_MouseIcon", "putref_MouseIcon", "get_MousePointer", "put_MousePointer", "get_Locked", "put_Locked", "get_Enabled", "put_Enabled", "get_MaxLength", "put_MaxLength", "get_MultiLine", "put_MultiLine", "get_ScrollBars", "put_ScrollBars", "get_DisableNoScroll", "put_DisableNoScroll", "get_SelAlignment", "put_SelAlignment", "get_SelBold", "put_SelBold", "get_SelItalic", "put_SelItalic", "get_SelUnderline", "put_SelUnderline", "get_SelColor", "put_SelColor", "get_SelFontName", "put_SelFontName", "get_SelFontSize", "put_SelFontSize", "get_SelCharOffset", "put_SelCharOffset", "get_TextRTF", "put_TextRTF", "get_SelStart", "put_SelStart", "get_SelLength", "put_SelLength", "get_SelText", "put_SelText", "get_SelRTF", "put_SelRTF", "Refresh"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    UseMouseForInput {
        get => this.get_UseMouseForInput()
        set => this.put_UseMouseForInput(value)
    }

    /**
     * @type {Integer} 
     */
    InkMode {
        get => this.get_InkMode()
        set => this.put_InkMode(value)
    }

    /**
     * @type {Integer} 
     */
    InkInsertMode {
        get => this.get_InkInsertMode()
        set => this.put_InkInsertMode(value)
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {Integer} 
     */
    RecognitionTimeout {
        get => this.get_RecognitionTimeout()
        set => this.put_RecognitionTimeout(value)
    }

    /**
     * @type {IInkRecognizer} 
     */
    Recognizer {
        get => this.get_Recognizer()
    }

    /**
     * @type {BSTR} 
     */
    Factoid {
        get => this.get_Factoid()
        set => this.put_Factoid(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelInks {
        get => this.get_SelInks()
        set => this.put_SelInks(value)
    }

    /**
     * @type {Integer} 
     */
    SelInksDisplayMode {
        get => this.get_SelInksDisplayMode()
        set => this.put_SelInksDisplayMode(value)
    }

    /**
     * @type {Integer} 
     */
    BackColor {
        get => this.get_BackColor()
        set => this.put_BackColor(value)
    }

    /**
     * @type {Integer} 
     */
    Appearance {
        get => this.get_Appearance()
        set => this.put_Appearance(value)
    }

    /**
     * @type {Integer} 
     */
    BorderStyle {
        get => this.get_BorderStyle()
        set => this.put_BorderStyle(value)
    }

    /**
     * @type {OLE_HANDLE} 
     */
    Hwnd {
        get => this.get_Hwnd()
    }

    /**
     * @type {IFontDisp} 
     */
    Font {
        get => this.get_Font()
    }

    /**
     * @type {BSTR} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * @type {IPictureDisp} 
     */
    MouseIcon {
        get => this.get_MouseIcon()
        set => this.put_MouseIcon(value)
    }

    /**
     * @type {Integer} 
     */
    MousePointer {
        get => this.get_MousePointer()
        set => this.put_MousePointer(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Locked {
        get => this.get_Locked()
        set => this.put_Locked(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MultiLine {
        get => this.get_MultiLine()
        set => this.put_MultiLine(value)
    }

    /**
     * @type {Integer} 
     */
    ScrollBars {
        get => this.get_ScrollBars()
        set => this.put_ScrollBars(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DisableNoScroll {
        get => this.get_DisableNoScroll()
        set => this.put_DisableNoScroll(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelAlignment {
        get => this.get_SelAlignment()
        set => this.put_SelAlignment(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelBold {
        get => this.get_SelBold()
        set => this.put_SelBold(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelItalic {
        get => this.get_SelItalic()
        set => this.put_SelItalic(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelUnderline {
        get => this.get_SelUnderline()
        set => this.put_SelUnderline(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelColor {
        get => this.get_SelColor()
        set => this.put_SelColor(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelFontName {
        get => this.get_SelFontName()
        set => this.put_SelFontName(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelFontSize {
        get => this.get_SelFontSize()
        set => this.put_SelFontSize(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelCharOffset {
        get => this.get_SelCharOffset()
        set => this.put_SelCharOffset(value)
    }

    /**
     * @type {BSTR} 
     */
    TextRTF {
        get => this.get_TextRTF()
        set => this.put_TextRTF(value)
    }

    /**
     * @type {Integer} 
     */
    SelStart {
        get => this.get_SelStart()
        set => this.put_SelStart(value)
    }

    /**
     * @type {Integer} 
     */
    SelLength {
        get => this.get_SelLength()
        set => this.put_SelLength(value)
    }

    /**
     * @type {BSTR} 
     */
    SelText {
        get => this.get_SelText()
        set => this.put_SelText(value)
    }

    /**
     * @type {BSTR} 
     */
    SelRTF {
        get => this.get_SelRTF()
        set => this.put_SelRTF(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_status
     */
    get_Status() {
        result := ComCall(7, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_usemouseforinput
     */
    get_UseMouseForInput() {
        result := ComCall(8, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_usemouseforinput
     */
    put_UseMouseForInput(newVal) {
        result := ComCall(9, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_inkmode
     */
    get_InkMode() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_inkmode
     */
    put_InkMode(newVal) {
        result := ComCall(11, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_inkinsertmode
     */
    get_InkInsertMode() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_inkinsertmode
     */
    put_InkInsertMode(newVal) {
        result := ComCall(13, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_drawingattributes
     */
    get_DrawingAttributes() {
        result := ComCall(14, this, "ptr*", &pVal := 0, "HRESULT")
        return IInkDrawingAttributes(pVal)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_drawingattributes
     */
    putref_DrawingAttributes(newVal) {
        result := ComCall(15, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_recognitiontimeout
     */
    get_RecognitionTimeout() {
        result := ComCall(16, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_recognitiontimeout
     */
    put_RecognitionTimeout(newVal) {
        result := ComCall(17, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkRecognizer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_recognizer
     */
    get_Recognizer() {
        result := ComCall(18, this, "ptr*", &pVal := 0, "HRESULT")
        return IInkRecognizer(pVal)
    }

    /**
     * 
     * @param {IInkRecognizer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_recognizer
     */
    putref_Recognizer(newVal) {
        result := ComCall(19, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_factoid
     */
    get_Factoid() {
        pVal := BSTR()
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_factoid
     */
    put_Factoid(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(21, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selinks
     */
    get_SelInks() {
        pSelInk := VARIANT()
        result := ComCall(22, this, "ptr", pSelInk, "HRESULT")
        return pSelInk
    }

    /**
     * 
     * @param {VARIANT} SelInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selinks
     */
    put_SelInks(SelInk) {
        result := ComCall(23, this, "ptr", SelInk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selinksdisplaymode
     */
    get_SelInksDisplayMode() {
        result := ComCall(24, this, "int*", &pInkDisplayMode := 0, "HRESULT")
        return pInkDisplayMode
    }

    /**
     * 
     * @param {Integer} InkDisplayMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selinksdisplaymode
     */
    put_SelInksDisplayMode(InkDisplayMode) {
        result := ComCall(25, this, "int", InkDisplayMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-recognize
     */
    Recognize() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-getgesturestatus
     */
    GetGestureStatus(Gesture) {
        result := ComCall(27, this, "int", Gesture, "short*", &pListen := 0, "HRESULT")
        return pListen
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-setgesturestatus
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(28, this, "int", Gesture, "short", Listen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} clr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_backcolor
     */
    put_BackColor(clr) {
        result := ComCall(29, this, "uint", clr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_backcolor
     */
    get_BackColor() {
        result := ComCall(30, this, "uint*", &pclr := 0, "HRESULT")
        return pclr
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_appearance
     */
    get_Appearance() {
        result := ComCall(31, this, "int*", &pAppearance := 0, "HRESULT")
        return pAppearance
    }

    /**
     * 
     * @param {Integer} pAppearance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_appearance
     */
    put_Appearance(pAppearance) {
        result := ComCall(32, this, "int", pAppearance, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_borderstyle
     */
    get_BorderStyle() {
        result := ComCall(33, this, "int*", &pBorderStyle := 0, "HRESULT")
        return pBorderStyle
    }

    /**
     * 
     * @param {Integer} pBorderStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_borderstyle
     */
    put_BorderStyle(pBorderStyle) {
        result := ComCall(34, this, "int", pBorderStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {OLE_HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_hwnd
     */
    get_Hwnd() {
        pohHwnd := OLE_HANDLE()
        result := ComCall(35, this, "ptr", pohHwnd, "HRESULT")
        return pohHwnd
    }

    /**
     * 
     * @returns {IFontDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_font
     */
    get_Font() {
        result := ComCall(36, this, "ptr*", &ppFont := 0, "HRESULT")
        return IFontDisp(ppFont)
    }

    /**
     * 
     * @param {IFontDisp} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_font
     */
    putref_Font(ppFont) {
        result := ComCall(37, this, "ptr", ppFont, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_text
     */
    get_Text() {
        pbstrText := BSTR()
        result := ComCall(38, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }

    /**
     * 
     * @param {BSTR} pbstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_text
     */
    put_Text(pbstrText) {
        pbstrText := pbstrText is String ? BSTR.Alloc(pbstrText).Value : pbstrText

        result := ComCall(39, this, "ptr", pbstrText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPictureDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_mouseicon
     */
    get_MouseIcon() {
        result := ComCall(40, this, "ptr*", &MouseIcon := 0, "HRESULT")
        return IPictureDisp(MouseIcon)
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_mouseicon
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(41, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPictureDisp} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-putref_mouseicon
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(42, this, "ptr", MouseIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_mousepointer
     */
    get_MousePointer() {
        result := ComCall(43, this, "int*", &MousePointer := 0, "HRESULT")
        return MousePointer
    }

    /**
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_mousepointer
     */
    put_MousePointer(MousePointer) {
        result := ComCall(44, this, "int", MousePointer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_locked
     */
    get_Locked() {
        result := ComCall(45, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_locked
     */
    put_Locked(newVal) {
        result := ComCall(46, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_enabled
     */
    get_Enabled() {
        result := ComCall(47, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_enabled
     */
    put_Enabled(newVal) {
        result := ComCall(48, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_maxlength
     */
    get_MaxLength() {
        result := ComCall(49, this, "int*", &plMaxLength := 0, "HRESULT")
        return plMaxLength
    }

    /**
     * 
     * @param {Integer} lMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_maxlength
     */
    put_MaxLength(lMaxLength) {
        result := ComCall(50, this, "int", lMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_multiline
     */
    get_MultiLine() {
        result := ComCall(51, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_multiline
     */
    put_MultiLine(newVal) {
        result := ComCall(52, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_scrollbars
     */
    get_ScrollBars() {
        result := ComCall(53, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_scrollbars
     */
    put_ScrollBars(newVal) {
        result := ComCall(54, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_disablenoscroll
     */
    get_DisableNoScroll() {
        result := ComCall(55, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_disablenoscroll
     */
    put_DisableNoScroll(newVal) {
        result := ComCall(56, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selalignment
     */
    get_SelAlignment() {
        pvarSelAlignment := VARIANT()
        result := ComCall(57, this, "ptr", pvarSelAlignment, "HRESULT")
        return pvarSelAlignment
    }

    /**
     * 
     * @param {VARIANT} pvarSelAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selalignment
     */
    put_SelAlignment(pvarSelAlignment) {
        result := ComCall(58, this, "ptr", pvarSelAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selbold
     */
    get_SelBold() {
        pvarSelBold := VARIANT()
        result := ComCall(59, this, "ptr", pvarSelBold, "HRESULT")
        return pvarSelBold
    }

    /**
     * 
     * @param {VARIANT} pvarSelBold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selbold
     */
    put_SelBold(pvarSelBold) {
        result := ComCall(60, this, "ptr", pvarSelBold, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selitalic
     */
    get_SelItalic() {
        pvarSelItalic := VARIANT()
        result := ComCall(61, this, "ptr", pvarSelItalic, "HRESULT")
        return pvarSelItalic
    }

    /**
     * 
     * @param {VARIANT} pvarSelItalic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selitalic
     */
    put_SelItalic(pvarSelItalic) {
        result := ComCall(62, this, "ptr", pvarSelItalic, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selunderline
     */
    get_SelUnderline() {
        pvarSelUnderline := VARIANT()
        result := ComCall(63, this, "ptr", pvarSelUnderline, "HRESULT")
        return pvarSelUnderline
    }

    /**
     * 
     * @param {VARIANT} pvarSelUnderline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selunderline
     */
    put_SelUnderline(pvarSelUnderline) {
        result := ComCall(64, this, "ptr", pvarSelUnderline, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selcolor
     */
    get_SelColor() {
        pvarSelColor := VARIANT()
        result := ComCall(65, this, "ptr", pvarSelColor, "HRESULT")
        return pvarSelColor
    }

    /**
     * 
     * @param {VARIANT} pvarSelColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selcolor
     */
    put_SelColor(pvarSelColor) {
        result := ComCall(66, this, "ptr", pvarSelColor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selfontname
     */
    get_SelFontName() {
        pvarSelFontName := VARIANT()
        result := ComCall(67, this, "ptr", pvarSelFontName, "HRESULT")
        return pvarSelFontName
    }

    /**
     * 
     * @param {VARIANT} pvarSelFontName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selfontname
     */
    put_SelFontName(pvarSelFontName) {
        result := ComCall(68, this, "ptr", pvarSelFontName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selfontsize
     */
    get_SelFontSize() {
        pvarSelFontSize := VARIANT()
        result := ComCall(69, this, "ptr", pvarSelFontSize, "HRESULT")
        return pvarSelFontSize
    }

    /**
     * 
     * @param {VARIANT} pvarSelFontSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selfontsize
     */
    put_SelFontSize(pvarSelFontSize) {
        result := ComCall(70, this, "ptr", pvarSelFontSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selcharoffset
     */
    get_SelCharOffset() {
        pvarSelCharOffset := VARIANT()
        result := ComCall(71, this, "ptr", pvarSelCharOffset, "HRESULT")
        return pvarSelCharOffset
    }

    /**
     * 
     * @param {VARIANT} pvarSelCharOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selcharoffset
     */
    put_SelCharOffset(pvarSelCharOffset) {
        result := ComCall(72, this, "ptr", pvarSelCharOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_textrtf
     */
    get_TextRTF() {
        pbstrTextRTF := BSTR()
        result := ComCall(73, this, "ptr", pbstrTextRTF, "HRESULT")
        return pbstrTextRTF
    }

    /**
     * 
     * @param {BSTR} pbstrTextRTF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_textrtf
     */
    put_TextRTF(pbstrTextRTF) {
        pbstrTextRTF := pbstrTextRTF is String ? BSTR.Alloc(pbstrTextRTF).Value : pbstrTextRTF

        result := ComCall(74, this, "ptr", pbstrTextRTF, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selstart
     */
    get_SelStart() {
        result := ComCall(75, this, "int*", &plSelStart := 0, "HRESULT")
        return plSelStart
    }

    /**
     * 
     * @param {Integer} plSelStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selstart
     */
    put_SelStart(plSelStart) {
        result := ComCall(76, this, "int", plSelStart, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_sellength
     */
    get_SelLength() {
        result := ComCall(77, this, "int*", &plSelLength := 0, "HRESULT")
        return plSelLength
    }

    /**
     * 
     * @param {Integer} plSelLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_sellength
     */
    put_SelLength(plSelLength) {
        result := ComCall(78, this, "int", plSelLength, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_seltext
     */
    get_SelText() {
        pbstrSelText := BSTR()
        result := ComCall(79, this, "ptr", pbstrSelText, "HRESULT")
        return pbstrSelText
    }

    /**
     * 
     * @param {BSTR} pbstrSelText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_seltext
     */
    put_SelText(pbstrSelText) {
        pbstrSelText := pbstrSelText is String ? BSTR.Alloc(pbstrSelText).Value : pbstrSelText

        result := ComCall(80, this, "ptr", pbstrSelText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selrtf
     */
    get_SelRTF() {
        pbstrSelRTF := BSTR()
        result := ComCall(81, this, "ptr", pbstrSelRTF, "HRESULT")
        return pbstrSelRTF
    }

    /**
     * 
     * @param {BSTR} pbstrSelRTF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-put_selrtf
     */
    put_SelRTF(pbstrSelRTF) {
        pbstrSelRTF := pbstrSelRTF is String ? BSTR.Alloc(pbstrSelRTF).Value : pbstrSelRTF

        result := ComCall(82, this, "ptr", pbstrSelRTF, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-refresh
     */
    Refresh() {
        result := ComCall(83, this, "HRESULT")
        return result
    }
}
