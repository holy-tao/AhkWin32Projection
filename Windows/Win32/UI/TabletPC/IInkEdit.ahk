#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_status
     */
    get_Status(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_usemouseforinput
     */
    get_UseMouseForInput(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_inkmode
     */
    get_InkMode(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_inkinsertmode
     */
    get_InkInsertMode(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<IInkDrawingAttributes>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_drawingattributes
     */
    get_DrawingAttributes(pVal) {
        result := ComCall(14, this, "ptr*", pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_recognitiontimeout
     */
    get_RecognitionTimeout(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<IInkRecognizer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_recognizer
     */
    get_Recognizer(pVal) {
        result := ComCall(18, this, "ptr*", pVal, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_factoid
     */
    get_Factoid(pVal) {
        result := ComCall(20, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pSelInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selinks
     */
    get_SelInks(pSelInk) {
        result := ComCall(22, this, "ptr", pSelInk, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pInkDisplayMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selinksdisplaymode
     */
    get_SelInksDisplayMode(pInkDisplayMode) {
        pInkDisplayModeMarshal := pInkDisplayMode is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pInkDisplayModeMarshal, pInkDisplayMode, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pListen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-getgesturestatus
     */
    GetGestureStatus(Gesture, pListen) {
        result := ComCall(27, this, "int", Gesture, "ptr", pListen, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pclr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_backcolor
     */
    get_BackColor(pclr) {
        pclrMarshal := pclr is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, pclrMarshal, pclr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAppearance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_appearance
     */
    get_Appearance(pAppearance) {
        pAppearanceMarshal := pAppearance is VarRef ? "int*" : "ptr"

        result := ComCall(31, this, pAppearanceMarshal, pAppearance, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pBorderStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_borderstyle
     */
    get_BorderStyle(pBorderStyle) {
        pBorderStyleMarshal := pBorderStyle is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pBorderStyleMarshal, pBorderStyle, "HRESULT")
        return result
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
     * @param {Pointer<OLE_HANDLE>} pohHwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_hwnd
     */
    get_Hwnd(pohHwnd) {
        result := ComCall(35, this, "ptr", pohHwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFontDisp>} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_font
     */
    get_Font(ppFont) {
        result := ComCall(36, this, "ptr*", ppFont, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_text
     */
    get_Text(pbstrText) {
        result := ComCall(38, this, "ptr", pbstrText, "HRESULT")
        return result
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
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_mouseicon
     */
    get_MouseIcon(MouseIcon) {
        result := ComCall(40, this, "ptr*", MouseIcon, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} MousePointer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_mousepointer
     */
    get_MousePointer(MousePointer) {
        MousePointerMarshal := MousePointer is VarRef ? "int*" : "ptr"

        result := ComCall(43, this, MousePointerMarshal, MousePointer, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_locked
     */
    get_Locked(pVal) {
        result := ComCall(45, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_enabled
     */
    get_Enabled(pVal) {
        result := ComCall(47, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_maxlength
     */
    get_MaxLength(plMaxLength) {
        plMaxLengthMarshal := plMaxLength is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, plMaxLengthMarshal, plMaxLength, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_multiline
     */
    get_MultiLine(pVal) {
        result := ComCall(51, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_scrollbars
     */
    get_ScrollBars(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(53, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_disablenoscroll
     */
    get_DisableNoScroll(pVal) {
        result := ComCall(55, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selalignment
     */
    get_SelAlignment(pvarSelAlignment) {
        result := ComCall(57, this, "ptr", pvarSelAlignment, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelBold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selbold
     */
    get_SelBold(pvarSelBold) {
        result := ComCall(59, this, "ptr", pvarSelBold, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelItalic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selitalic
     */
    get_SelItalic(pvarSelItalic) {
        result := ComCall(61, this, "ptr", pvarSelItalic, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelUnderline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selunderline
     */
    get_SelUnderline(pvarSelUnderline) {
        result := ComCall(63, this, "ptr", pvarSelUnderline, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelColor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selcolor
     */
    get_SelColor(pvarSelColor) {
        result := ComCall(65, this, "ptr", pvarSelColor, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelFontName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selfontname
     */
    get_SelFontName(pvarSelFontName) {
        result := ComCall(67, this, "ptr", pvarSelFontName, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelFontSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selfontsize
     */
    get_SelFontSize(pvarSelFontSize) {
        result := ComCall(69, this, "ptr", pvarSelFontSize, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pvarSelCharOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selcharoffset
     */
    get_SelCharOffset(pvarSelCharOffset) {
        result := ComCall(71, this, "ptr", pvarSelCharOffset, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrTextRTF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_textrtf
     */
    get_TextRTF(pbstrTextRTF) {
        result := ComCall(73, this, "ptr", pbstrTextRTF, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plSelStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selstart
     */
    get_SelStart(plSelStart) {
        plSelStartMarshal := plSelStart is VarRef ? "int*" : "ptr"

        result := ComCall(75, this, plSelStartMarshal, plSelStart, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plSelLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_sellength
     */
    get_SelLength(plSelLength) {
        plSelLengthMarshal := plSelLength is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, plSelLengthMarshal, plSelLength, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrSelText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_seltext
     */
    get_SelText(pbstrSelText) {
        result := ComCall(79, this, "ptr", pbstrSelText, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrSelRTF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inked/nf-inked-iinkedit-get_selrtf
     */
    get_SelRTF(pbstrSelRTF) {
        result := ComCall(81, this, "ptr", pbstrSelRTF, "HRESULT")
        return result
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
