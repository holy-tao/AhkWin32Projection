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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaretType", "SetCaretType", "GetDisplays", "GetDocumentFont", "SetDocumentFont", "GetDocumentPara", "SetDocumentPara", "GetEastAsianFlags", "GetGenerator", "SetIMEInProgress", "GetNotificationMode", "SetNotificationMode", "GetSelection2", "GetStoryRanges2", "GetTypographyOptions", "GetVersion", "GetWindow", "AttachMsgFilter", "CheckTextLimit", "GetCallManager", "GetClientRect", "GetEffectColor", "GetImmContext", "GetPreferredFont", "GetProperty", "GetStrings", "Notify", "Range2", "RangeFromPoint2", "ReleaseCallManager", "ReleaseImmContext", "SetEffectColor", "SetProperty", "SetTypographyOptions", "SysBeep", "Update", "UpdateWindow", "GetMathProperties", "SetMathProperties", "GetActiveStory", "SetActiveStory", "GetMainStory", "GetNewStory", "GetStory"]

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getcarettype
     */
    GetCaretType(pValue) {
        result := ComCall(26, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setcarettype
     */
    SetCaretType(Value) {
        result := ComCall(27, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextDisplays>} ppDisplays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getdisplays
     */
    GetDisplays(ppDisplays) {
        result := ComCall(28, this, "ptr*", ppDisplays, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont2>} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getdocumentfont
     */
    GetDocumentFont(ppFont) {
        result := ComCall(29, this, "ptr*", ppFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextFont2} pFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setdocumentfont
     */
    SetDocumentFont(pFont) {
        result := ComCall(30, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara2>} ppPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getdocumentpara
     */
    GetDocumentPara(ppPara) {
        result := ComCall(31, this, "ptr*", ppPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextPara2} pPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setdocumentpara
     */
    SetDocumentPara(pPara) {
        result := ComCall(32, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-geteastasianflags
     */
    GetEastAsianFlags(pFlags) {
        result := ComCall(33, this, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getgenerator
     */
    GetGenerator(pbstr) {
        result := ComCall(34, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setimeinprogress
     */
    SetIMEInProgress(Value) {
        result := ComCall(35, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getnotificationmode
     */
    GetNotificationMode(pValue) {
        result := ComCall(36, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setnotificationmode
     */
    SetNotificationMode(Value) {
        result := ComCall(37, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextSelection2>} ppSel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getselection2
     */
    GetSelection2(ppSel) {
        result := ComCall(38, this, "ptr*", ppSel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextStoryRanges2>} ppStories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getstoryranges2
     */
    GetStoryRanges2(ppStories) {
        result := ComCall(39, this, "ptr*", ppStories, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-gettypographyoptions
     */
    GetTypographyOptions(pOptions) {
        result := ComCall(40, this, "int*", pOptions, "HRESULT")
        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pValue) {
        result := ComCall(41, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @param {Pointer<Integer>} pHwnd 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a window handle. If no window exists with the specified relationship to the specified window, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow(pHwnd) {
        result := ComCall(42, this, "int64*", pHwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-attachmsgfilter
     */
    AttachMsgFilter(pFilter) {
        result := ComCall(43, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-checktextlimit
     */
    CheckTextLimit(cch, pcch) {
        result := ComCall(44, this, "int", cch, "int*", pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppVoid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getcallmanager
     */
    GetCallManager(ppVoid) {
        result := ComCall(45, this, "ptr*", ppVoid, "HRESULT")
        return result
    }

    /**
     * Retrieves the coordinates of a window's client area.
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pRight 
     * @param {Pointer<Integer>} pBottom 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclientrect
     */
    GetClientRect(Type, pLeft, pTop, pRight, pBottom) {
        result := ComCall(46, this, "int", Type, "int*", pLeft, "int*", pTop, "int*", pRight, "int*", pBottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-geteffectcolor
     */
    GetEffectColor(Index, pValue) {
        result := ComCall(47, this, "int", Index, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getimmcontext
     */
    GetImmContext(pContext) {
        result := ComCall(48, this, "int64*", pContext, "HRESULT")
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
     * @param {Pointer<Integer>} pPitchAndFamily 
     * @param {Pointer<Integer>} pNewFontSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getpreferredfont
     */
    GetPreferredFont(cp, CharRep, Options, curCharRep, curFontSize, pbstr, pPitchAndFamily, pNewFontSize) {
        result := ComCall(49, this, "int", cp, "int", CharRep, "int", Options, "int", curCharRep, "int", curFontSize, "ptr", pbstr, "int*", pPitchAndFamily, "int*", pNewFontSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getproperty
     */
    GetProperty(Type, pValue) {
        result := ComCall(50, this, "int", Type, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextStrings>} ppStrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getstrings
     */
    GetStrings(ppStrs) {
        result := ComCall(51, this, "ptr*", ppStrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Notify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-notify
     */
    Notify(Notify) {
        result := ComCall(52, this, "int", Notify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cpActive 
     * @param {Integer} cpAnchor 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-range2
     */
    Range2(cpActive, cpAnchor, ppRange) {
        result := ComCall(53, this, "int", cpActive, "int", cpAnchor, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} Type 
     * @param {Pointer<ITextRange2>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-rangefrompoint2
     */
    RangeFromPoint2(x, y, Type, ppRange) {
        result := ComCall(54, this, "int", x, "int", y, "int", Type, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pVoid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-releasecallmanager
     */
    ReleaseCallManager(pVoid) {
        result := ComCall(55, this, "ptr", pVoid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-releaseimmcontext
     */
    ReleaseImmContext(Context) {
        result := ComCall(56, this, "int64", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-seteffectcolor
     */
    SetEffectColor(Index, Value) {
        result := ComCall(57, this, "int", Index, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(58, this, "int", Type, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-settypographyoptions
     */
    SetTypographyOptions(Options, Mask) {
        result := ComCall(59, this, "int", Options, "int", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-sysbeep
     */
    SysBeep() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-update
     */
    Update(Value) {
        result := ComCall(61, this, "int", Value, "HRESULT")
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
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getmathproperties
     */
    GetMathProperties(pOptions) {
        result := ComCall(63, this, "int*", pOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setmathproperties
     */
    SetMathProperties(Options, Mask) {
        result := ComCall(64, this, "int", Options, "int", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getactivestory
     */
    GetActiveStory(ppStory) {
        result := ComCall(65, this, "ptr*", ppStory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextStory} pStory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-setactivestory
     */
    SetActiveStory(pStory) {
        result := ComCall(66, this, "ptr", pStory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getmainstory
     */
    GetMainStory(ppStory) {
        result := ComCall(67, this, "ptr*", ppStory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getnewstory
     */
    GetNewStory(ppStory) {
        result := ComCall(68, this, "ptr*", ppStory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<ITextStory>} ppStory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getstory
     */
    GetStory(Index, ppStory) {
        result := ComCall(69, this, "int", Index, "ptr*", ppStory, "HRESULT")
        return result
    }
}
