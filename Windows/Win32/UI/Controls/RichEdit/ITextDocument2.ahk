#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextDisplays.ahk
#Include .\ITextFont2.ahk
#Include .\ITextPara2.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextSelection2.ahk
#Include .\ITextStoryRanges2.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextStrings.ahk
#Include .\ITextRange2.ahk
#Include .\ITextStory.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getcarettype
     */
    GetCaretType() {
        result := ComCall(26, this, "int*", &pValue := 0, "HRESULT")
        return pValue
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
     * @returns {ITextDisplays} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getdisplays
     */
    GetDisplays() {
        result := ComCall(28, this, "ptr*", &ppDisplays := 0, "HRESULT")
        return ITextDisplays(ppDisplays)
    }

    /**
     * 
     * @returns {ITextFont2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getdocumentfont
     */
    GetDocumentFont() {
        result := ComCall(29, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont2(ppFont)
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
     * @returns {ITextPara2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getdocumentpara
     */
    GetDocumentPara() {
        result := ComCall(31, this, "ptr*", &ppPara := 0, "HRESULT")
        return ITextPara2(ppPara)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-geteastasianflags
     */
    GetEastAsianFlags() {
        result := ComCall(33, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getgenerator
     */
    GetGenerator() {
        pbstr := BSTR()
        result := ComCall(34, this, "ptr", pbstr, "HRESULT")
        return pbstr
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getnotificationmode
     */
    GetNotificationMode() {
        result := ComCall(36, this, "int*", &pValue := 0, "HRESULT")
        return pValue
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
     * @returns {ITextSelection2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getselection2
     */
    GetSelection2() {
        result := ComCall(38, this, "ptr*", &ppSel := 0, "HRESULT")
        return ITextSelection2(ppSel)
    }

    /**
     * 
     * @returns {ITextStoryRanges2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getstoryranges2
     */
    GetStoryRanges2() {
        result := ComCall(39, this, "ptr*", &ppStories := 0, "HRESULT")
        return ITextStoryRanges2(ppStories)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-gettypographyoptions
     */
    GetTypographyOptions() {
        result := ComCall(40, this, "int*", &pOptions := 0, "HRESULT")
        return pOptions
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        result := ComCall(41, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow() {
        result := ComCall(42, this, "int64*", &pHwnd := 0, "HRESULT")
        return pHwnd
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
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, "int", cch, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getcallmanager
     */
    GetCallManager() {
        result := ComCall(45, this, "ptr*", &ppVoid := 0, "HRESULT")
        return IUnknown(ppVoid)
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
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pRightMarshal := pRight is VarRef ? "int*" : "ptr"
        pBottomMarshal := pBottom is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, "int", Type, pLeftMarshal, pLeft, pTopMarshal, pTop, pRightMarshal, pRight, pBottomMarshal, pBottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-geteffectcolor
     */
    GetEffectColor(Index) {
        result := ComCall(47, this, "int", Index, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getimmcontext
     */
    GetImmContext() {
        result := ComCall(48, this, "int64*", &pContext := 0, "HRESULT")
        return pContext
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
        pPitchAndFamilyMarshal := pPitchAndFamily is VarRef ? "int*" : "ptr"
        pNewFontSizeMarshal := pNewFontSize is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, "int", cp, "int", CharRep, "int", Options, "int", curCharRep, "int", curFontSize, "ptr", pbstr, pPitchAndFamilyMarshal, pPitchAndFamily, pNewFontSizeMarshal, pNewFontSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getproperty
     */
    GetProperty(Type) {
        result := ComCall(50, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {ITextStrings} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getstrings
     */
    GetStrings() {
        result := ComCall(51, this, "ptr*", &ppStrs := 0, "HRESULT")
        return ITextStrings(ppStrs)
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
     * @returns {ITextRange2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-range2
     */
    Range2(cpActive, cpAnchor) {
        result := ComCall(53, this, "int", cpActive, "int", cpAnchor, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} Type 
     * @returns {ITextRange2} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-rangefrompoint2
     */
    RangeFromPoint2(x, y, Type) {
        result := ComCall(54, this, "int", x, "int", y, "int", Type, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange2(ppRange)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getmathproperties
     */
    GetMathProperties() {
        result := ComCall(63, this, "int*", &pOptions := 0, "HRESULT")
        return pOptions
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
     * @returns {ITextStory} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getactivestory
     */
    GetActiveStory() {
        result := ComCall(65, this, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
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
     * @returns {ITextStory} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getmainstory
     */
    GetMainStory() {
        result := ComCall(67, this, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }

    /**
     * 
     * @returns {ITextStory} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getnewstory
     */
    GetNewStory() {
        result := ComCall(68, this, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {ITextStory} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextdocument2-getstory
     */
    GetStory(Index) {
        result := ComCall(69, this, "int", Index, "ptr*", &ppStory := 0, "HRESULT")
        return ITextStory(ppStory)
    }
}
