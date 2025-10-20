#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextDocument.ahk

/**
 * Extends the ITextDocument interface, adding methods that enable the Input Method Editor (IME) to drive the rich edit control, and methods to retrieve other interfaces such as ITextDisplays, ITextRange2, ITextFont2, ITextPara2, and so on.
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextdocument2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDocument2 extends ITextDocument{
    /**
     * The interface identifier for ITextDocument2
     * @type {Guid}
     */
    static IID => Guid("{c241f5e0-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCaretType(pValue) {
        result := ComCall(26, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCaretType(Value) {
        result := ComCall(27, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextDisplays>} ppDisplays 
     * @returns {HRESULT} 
     */
    GetDisplays(ppDisplays) {
        result := ComCall(28, this, "ptr", ppDisplays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} ppFont 
     * @returns {HRESULT} 
     */
    GetDocumentFont(ppFont) {
        result := ComCall(29, this, "ptr", ppFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} pFont 
     * @returns {HRESULT} 
     */
    SetDocumentFont(pFont) {
        result := ComCall(30, this, "ptr", pFont, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} ppPara 
     * @returns {HRESULT} 
     */
    GetDocumentPara(ppPara) {
        result := ComCall(31, this, "ptr", ppPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} pPara 
     * @returns {HRESULT} 
     */
    SetDocumentPara(pPara) {
        result := ComCall(32, this, "ptr", pPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    GetEastAsianFlags(pFlags) {
        result := ComCall(33, this, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetGenerator(pbstr) {
        result := ComCall(34, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetIMEInProgress(Value) {
        result := ComCall(35, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetNotificationMode(pValue) {
        result := ComCall(36, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetNotificationMode(Value) {
        result := ComCall(37, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextSelection2>} ppSel 
     * @returns {HRESULT} 
     */
    GetSelection2(ppSel) {
        result := ComCall(38, this, "ptr", ppSel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStoryRanges2>} ppStories 
     * @returns {HRESULT} 
     */
    GetStoryRanges2(ppStories) {
        result := ComCall(39, this, "ptr", ppStories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pOptions 
     * @returns {HRESULT} 
     */
    GetTypographyOptions(pOptions) {
        result := ComCall(40, this, "int*", pOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pValue) {
        result := ComCall(41, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @param {Pointer<Int64>} pHwnd 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a window handle. If no window exists with the specified relationship to the specified window, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow(pHwnd) {
        result := ComCall(42, this, "int64*", pHwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pFilter 
     * @returns {HRESULT} 
     */
    AttachMsgFilter(pFilter) {
        result := ComCall(43, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cch 
     * @param {Pointer<Int32>} pcch 
     * @returns {HRESULT} 
     */
    CheckTextLimit(cch, pcch) {
        result := ComCall(44, this, "int", cch, "int*", pcch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppVoid 
     * @returns {HRESULT} 
     */
    GetCallManager(ppVoid) {
        result := ComCall(45, this, "ptr", ppVoid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the coordinates of a window's client area.
     * @param {Integer} Type 
     * @param {Pointer<Int32>} pLeft 
     * @param {Pointer<Int32>} pTop 
     * @param {Pointer<Int32>} pRight 
     * @param {Pointer<Int32>} pBottom 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclientrect
     */
    GetClientRect(Type, pLeft, pTop, pRight, pBottom) {
        result := ComCall(46, this, "int", Type, "int*", pLeft, "int*", pTop, "int*", pRight, "int*", pBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetEffectColor(Index, pValue) {
        result := ComCall(47, this, "int", Index, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pContext 
     * @returns {HRESULT} 
     */
    GetImmContext(pContext) {
        result := ComCall(48, this, "int64*", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cp 
     * @param {Integer} CharRep 
     * @param {Integer} Options 
     * @param {Integer} curCharRep 
     * @param {Integer} curFontSize 
     * @param {Pointer<BSTR>} pbstr 
     * @param {Pointer<Int32>} pPitchAndFamily 
     * @param {Pointer<Int32>} pNewFontSize 
     * @returns {HRESULT} 
     */
    GetPreferredFont(cp, CharRep, Options, curCharRep, curFontSize, pbstr, pPitchAndFamily, pNewFontSize) {
        result := ComCall(49, this, "int", cp, "int", CharRep, "int", Options, "int", curCharRep, "int", curFontSize, "ptr", pbstr, "int*", pPitchAndFamily, "int*", pNewFontSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetProperty(Type, pValue) {
        result := ComCall(50, this, "int", Type, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStrings>} ppStrs 
     * @returns {HRESULT} 
     */
    GetStrings(ppStrs) {
        result := ComCall(51, this, "ptr", ppStrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Notify 
     * @returns {HRESULT} 
     */
    Notify(Notify) {
        result := ComCall(52, this, "int", Notify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cpActive 
     * @param {Integer} cpAnchor 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     */
    Range2(cpActive, cpAnchor, ppRange) {
        result := ComCall(53, this, "int", cpActive, "int", cpAnchor, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} Type 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     */
    RangeFromPoint2(x, y, Type, ppRange) {
        result := ComCall(54, this, "int", x, "int", y, "int", Type, "ptr", ppRange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pVoid 
     * @returns {HRESULT} 
     */
    ReleaseCallManager(pVoid) {
        result := ComCall(55, this, "ptr", pVoid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     */
    ReleaseImmContext(Context) {
        result := ComCall(56, this, "int64", Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetEffectColor(Index, Value) {
        result := ComCall(57, this, "int", Index, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetProperty(Type, Value) {
        result := ComCall(58, this, "int", Type, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetTypographyOptions(Options, Mask) {
        result := ComCall(59, this, "int", Options, "int", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SysBeep() {
        result := ComCall(60, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    Update(Value) {
        result := ComCall(61, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The UpdateWindow function updates the client area of the specified window by sending a WM_PAINT message to the window if the window's update region is not empty.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-updatewindow
     */
    UpdateWindow() {
        result := ComCall(62, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pOptions 
     * @returns {HRESULT} 
     */
    GetMathProperties(pOptions) {
        result := ComCall(63, this, "int*", pOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetMathProperties(Options, Mask) {
        result := ComCall(64, this, "int", Options, "int", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     */
    GetActiveStory(ppStory) {
        result := ComCall(65, this, "ptr", ppStory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} pStory 
     * @returns {HRESULT} 
     */
    SetActiveStory(pStory) {
        result := ComCall(66, this, "ptr", pStory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     */
    GetMainStory(ppStory) {
        result := ComCall(67, this, "ptr", ppStory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     */
    GetNewStory(ppStory) {
        result := ComCall(68, this, "ptr", ppStory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     */
    GetStory(Index, ppStory) {
        result := ComCall(69, this, "int", Index, "ptr", ppStory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
