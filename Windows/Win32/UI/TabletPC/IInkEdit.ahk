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
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    get_Status(pStatus) {
        result := ComCall(7, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_UseMouseForInput(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_UseMouseForInput(newVal) {
        result := ComCall(9, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_InkMode(pVal) {
        result := ComCall(10, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_InkMode(newVal) {
        result := ComCall(11, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_InkInsertMode(pVal) {
        result := ComCall(12, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_InkInsertMode(newVal) {
        result := ComCall(13, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} pVal 
     * @returns {HRESULT} 
     */
    get_DrawingAttributes(pVal) {
        result := ComCall(14, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} newVal 
     * @returns {HRESULT} 
     */
    putref_DrawingAttributes(newVal) {
        result := ComCall(15, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_RecognitionTimeout(pVal) {
        result := ComCall(16, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_RecognitionTimeout(newVal) {
        result := ComCall(17, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizer>} pVal 
     * @returns {HRESULT} 
     */
    get_Recognizer(pVal) {
        result := ComCall(18, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizer>} newVal 
     * @returns {HRESULT} 
     */
    putref_Recognizer(newVal) {
        result := ComCall(19, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Factoid(pVal) {
        result := ComCall(20, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Factoid(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(21, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pSelInk 
     * @returns {HRESULT} 
     */
    get_SelInks(pSelInk) {
        result := ComCall(22, this, "ptr", pSelInk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} SelInk 
     * @returns {HRESULT} 
     */
    put_SelInks(SelInk) {
        result := ComCall(23, this, "ptr", SelInk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pInkDisplayMode 
     * @returns {HRESULT} 
     */
    get_SelInksDisplayMode(pInkDisplayMode) {
        result := ComCall(24, this, "int*", pInkDisplayMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InkDisplayMode 
     * @returns {HRESULT} 
     */
    put_SelInksDisplayMode(InkDisplayMode) {
        result := ComCall(25, this, "int", InkDisplayMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Recognize() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {Pointer<VARIANT_BOOL>} pListen 
     * @returns {HRESULT} 
     */
    GetGestureStatus(Gesture, pListen) {
        result := ComCall(27, this, "int", Gesture, "ptr", pListen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Gesture 
     * @param {VARIANT_BOOL} Listen 
     * @returns {HRESULT} 
     */
    SetGestureStatus(Gesture, Listen) {
        result := ComCall(28, this, "int", Gesture, "short", Listen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} clr 
     * @returns {HRESULT} 
     */
    put_BackColor(clr) {
        result := ComCall(29, this, "uint", clr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pclr 
     * @returns {HRESULT} 
     */
    get_BackColor(pclr) {
        result := ComCall(30, this, "uint*", pclr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAppearance 
     * @returns {HRESULT} 
     */
    get_Appearance(pAppearance) {
        result := ComCall(31, this, "int*", pAppearance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pAppearance 
     * @returns {HRESULT} 
     */
    put_Appearance(pAppearance) {
        result := ComCall(32, this, "int", pAppearance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBorderStyle 
     * @returns {HRESULT} 
     */
    get_BorderStyle(pBorderStyle) {
        result := ComCall(33, this, "int*", pBorderStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pBorderStyle 
     * @returns {HRESULT} 
     */
    put_BorderStyle(pBorderStyle) {
        result := ComCall(34, this, "int", pBorderStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OLE_HANDLE>} pohHwnd 
     * @returns {HRESULT} 
     */
    get_Hwnd(pohHwnd) {
        result := ComCall(35, this, "ptr", pohHwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFontDisp>} ppFont 
     * @returns {HRESULT} 
     */
    get_Font(ppFont) {
        result := ComCall(36, this, "ptr", ppFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFontDisp>} ppFont 
     * @returns {HRESULT} 
     */
    putref_Font(ppFont) {
        result := ComCall(37, this, "ptr", ppFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     */
    get_Text(pbstrText) {
        result := ComCall(38, this, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pbstrText 
     * @returns {HRESULT} 
     */
    put_Text(pbstrText) {
        pbstrText := pbstrText is String ? BSTR.Alloc(pbstrText).Value : pbstrText

        result := ComCall(39, this, "ptr", pbstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     */
    get_MouseIcon(MouseIcon) {
        result := ComCall(40, this, "ptr", MouseIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     */
    put_MouseIcon(MouseIcon) {
        result := ComCall(41, this, "ptr", MouseIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPictureDisp>} MouseIcon 
     * @returns {HRESULT} 
     */
    putref_MouseIcon(MouseIcon) {
        result := ComCall(42, this, "ptr", MouseIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MousePointer 
     * @returns {HRESULT} 
     */
    get_MousePointer(MousePointer) {
        result := ComCall(43, this, "int*", MousePointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MousePointer 
     * @returns {HRESULT} 
     */
    put_MousePointer(MousePointer) {
        result := ComCall(44, this, "int", MousePointer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Locked(pVal) {
        result := ComCall(45, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Locked(newVal) {
        result := ComCall(46, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Enabled(pVal) {
        result := ComCall(47, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Enabled(newVal) {
        result := ComCall(48, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMaxLength 
     * @returns {HRESULT} 
     */
    get_MaxLength(plMaxLength) {
        result := ComCall(49, this, "int*", plMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMaxLength 
     * @returns {HRESULT} 
     */
    put_MaxLength(lMaxLength) {
        result := ComCall(50, this, "int", lMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_MultiLine(pVal) {
        result := ComCall(51, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_MultiLine(newVal) {
        result := ComCall(52, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ScrollBars(pVal) {
        result := ComCall(53, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_ScrollBars(newVal) {
        result := ComCall(54, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_DisableNoScroll(pVal) {
        result := ComCall(55, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_DisableNoScroll(newVal) {
        result := ComCall(56, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelAlignment 
     * @returns {HRESULT} 
     */
    get_SelAlignment(pvarSelAlignment) {
        result := ComCall(57, this, "ptr", pvarSelAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelAlignment 
     * @returns {HRESULT} 
     */
    put_SelAlignment(pvarSelAlignment) {
        result := ComCall(58, this, "ptr", pvarSelAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelBold 
     * @returns {HRESULT} 
     */
    get_SelBold(pvarSelBold) {
        result := ComCall(59, this, "ptr", pvarSelBold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelBold 
     * @returns {HRESULT} 
     */
    put_SelBold(pvarSelBold) {
        result := ComCall(60, this, "ptr", pvarSelBold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelItalic 
     * @returns {HRESULT} 
     */
    get_SelItalic(pvarSelItalic) {
        result := ComCall(61, this, "ptr", pvarSelItalic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelItalic 
     * @returns {HRESULT} 
     */
    put_SelItalic(pvarSelItalic) {
        result := ComCall(62, this, "ptr", pvarSelItalic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelUnderline 
     * @returns {HRESULT} 
     */
    get_SelUnderline(pvarSelUnderline) {
        result := ComCall(63, this, "ptr", pvarSelUnderline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelUnderline 
     * @returns {HRESULT} 
     */
    put_SelUnderline(pvarSelUnderline) {
        result := ComCall(64, this, "ptr", pvarSelUnderline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelColor 
     * @returns {HRESULT} 
     */
    get_SelColor(pvarSelColor) {
        result := ComCall(65, this, "ptr", pvarSelColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelColor 
     * @returns {HRESULT} 
     */
    put_SelColor(pvarSelColor) {
        result := ComCall(66, this, "ptr", pvarSelColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelFontName 
     * @returns {HRESULT} 
     */
    get_SelFontName(pvarSelFontName) {
        result := ComCall(67, this, "ptr", pvarSelFontName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelFontName 
     * @returns {HRESULT} 
     */
    put_SelFontName(pvarSelFontName) {
        result := ComCall(68, this, "ptr", pvarSelFontName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelFontSize 
     * @returns {HRESULT} 
     */
    get_SelFontSize(pvarSelFontSize) {
        result := ComCall(69, this, "ptr", pvarSelFontSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelFontSize 
     * @returns {HRESULT} 
     */
    put_SelFontSize(pvarSelFontSize) {
        result := ComCall(70, this, "ptr", pvarSelFontSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarSelCharOffset 
     * @returns {HRESULT} 
     */
    get_SelCharOffset(pvarSelCharOffset) {
        result := ComCall(71, this, "ptr", pvarSelCharOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} pvarSelCharOffset 
     * @returns {HRESULT} 
     */
    put_SelCharOffset(pvarSelCharOffset) {
        result := ComCall(72, this, "ptr", pvarSelCharOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTextRTF 
     * @returns {HRESULT} 
     */
    get_TextRTF(pbstrTextRTF) {
        result := ComCall(73, this, "ptr", pbstrTextRTF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pbstrTextRTF 
     * @returns {HRESULT} 
     */
    put_TextRTF(pbstrTextRTF) {
        pbstrTextRTF := pbstrTextRTF is String ? BSTR.Alloc(pbstrTextRTF).Value : pbstrTextRTF

        result := ComCall(74, this, "ptr", pbstrTextRTF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSelStart 
     * @returns {HRESULT} 
     */
    get_SelStart(plSelStart) {
        result := ComCall(75, this, "int*", plSelStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} plSelStart 
     * @returns {HRESULT} 
     */
    put_SelStart(plSelStart) {
        result := ComCall(76, this, "int", plSelStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSelLength 
     * @returns {HRESULT} 
     */
    get_SelLength(plSelLength) {
        result := ComCall(77, this, "int*", plSelLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} plSelLength 
     * @returns {HRESULT} 
     */
    put_SelLength(plSelLength) {
        result := ComCall(78, this, "int", plSelLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSelText 
     * @returns {HRESULT} 
     */
    get_SelText(pbstrSelText) {
        result := ComCall(79, this, "ptr", pbstrSelText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pbstrSelText 
     * @returns {HRESULT} 
     */
    put_SelText(pbstrSelText) {
        pbstrSelText := pbstrSelText is String ? BSTR.Alloc(pbstrSelText).Value : pbstrSelText

        result := ComCall(80, this, "ptr", pbstrSelText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSelRTF 
     * @returns {HRESULT} 
     */
    get_SelRTF(pbstrSelRTF) {
        result := ComCall(81, this, "ptr", pbstrSelRTF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pbstrSelRTF 
     * @returns {HRESULT} 
     */
    put_SelRTF(pbstrSelRTF) {
        pbstrSelRTF := pbstrSelRTF is String ? BSTR.Alloc(pbstrSelRTF).Value : pbstrSelRTF

        result := ComCall(82, this, "ptr", pbstrSelRTF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(83, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
