#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextDocument.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextDocument2Old extends ITextDocument{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument2Old
     * @type {Guid}
     */
    static IID => Guid("{01c25500-4268-11d1-883a-3c8b00c10000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachMsgFilter", "SetEffectColor", "GetEffectColor", "GetCaretType", "SetCaretType", "GetImmContext", "ReleaseImmContext", "GetPreferredFont", "GetNotificationMode", "SetNotificationMode", "GetClientRect", "GetSelection2", "GetWindow", "GetFEFlags", "UpdateWindow", "CheckTextLimit", "IMEInProgress", "SysBeep", "Update", "Notify", "GetDocumentFont", "GetDocumentPara", "GetCallManager", "ReleaseCallManager"]

    /**
     * 
     * @param {IUnknown} pFilter 
     * @returns {HRESULT} 
     */
    AttachMsgFilter(pFilter) {
        result := ComCall(26, this, "ptr", pFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {COLORREF} cr 
     * @returns {HRESULT} 
     */
    SetEffectColor(Index, cr) {
        result := ComCall(27, this, "int", Index, "uint", cr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<COLORREF>} pcr 
     * @returns {HRESULT} 
     */
    GetEffectColor(Index, pcr) {
        result := ComCall(28, this, "int", Index, "ptr", pcr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCaretType 
     * @returns {HRESULT} 
     */
    GetCaretType(pCaretType) {
        pCaretTypeMarshal := pCaretType is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pCaretTypeMarshal, pCaretType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CaretType 
     * @returns {HRESULT} 
     */
    SetCaretType(CaretType) {
        result := ComCall(30, this, "int", CaretType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pContext 
     * @returns {HRESULT} 
     */
    GetImmContext(pContext) {
        pContextMarshal := pContext is VarRef ? "int64*" : "ptr"

        result := ComCall(31, this, pContextMarshal, pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     */
    ReleaseImmContext(Context) {
        result := ComCall(32, this, "int64", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cp 
     * @param {Integer} CharRep 
     * @param {Integer} Option 
     * @param {Integer} CharRepCur 
     * @param {Integer} curFontSize 
     * @param {Pointer<BSTR>} pbstr 
     * @param {Pointer<Integer>} pPitchAndFamily 
     * @param {Pointer<Integer>} pNewFontSize 
     * @returns {HRESULT} 
     */
    GetPreferredFont(cp, CharRep, Option, CharRepCur, curFontSize, pbstr, pPitchAndFamily, pNewFontSize) {
        pPitchAndFamilyMarshal := pPitchAndFamily is VarRef ? "int*" : "ptr"
        pNewFontSizeMarshal := pNewFontSize is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, "int", cp, "int", CharRep, "int", Option, "int", CharRepCur, "int", curFontSize, "ptr", pbstr, pPitchAndFamilyMarshal, pPitchAndFamily, pNewFontSizeMarshal, pNewFontSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMode 
     * @returns {HRESULT} 
     */
    GetNotificationMode(pMode) {
        pModeMarshal := pMode is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pModeMarshal, pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    SetNotificationMode(Mode) {
        result := ComCall(35, this, "int", Mode, "HRESULT")
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
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pRightMarshal := pRight is VarRef ? "int*" : "ptr"
        pBottomMarshal := pBottom is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, "int", Type, pLeftMarshal, pLeft, pTopMarshal, pTop, pRightMarshal, pRight, pBottomMarshal, pBottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextSelection>} ppSel 
     * @returns {HRESULT} 
     */
    GetSelection2(ppSel) {
        result := ComCall(37, this, "ptr*", ppSel, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @param {Pointer<Integer>} phWnd 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a window handle. If no window exists with the specified relationship to the specified window, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow(phWnd) {
        phWndMarshal := phWnd is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, phWndMarshal, phWnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     */
    GetFEFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, pFlagsMarshal, pFlags, "HRESULT")
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
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cch 
     * @param {Pointer<Integer>} pcch 
     * @returns {HRESULT} 
     */
    CheckTextLimit(cch, pcch) {
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, "int", cch, pcchMarshal, pcch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    IMEInProgress(Value) {
        result := ComCall(42, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SysBeep() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    Update(Mode) {
        result := ComCall(44, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Notify 
     * @returns {HRESULT} 
     */
    Notify(Notify) {
        result := ComCall(45, this, "int", Notify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextFont>} ppITextFont 
     * @returns {HRESULT} 
     */
    GetDocumentFont(ppITextFont) {
        result := ComCall(46, this, "ptr*", ppITextFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara>} ppITextPara 
     * @returns {HRESULT} 
     */
    GetDocumentPara(ppITextPara) {
        result := ComCall(47, this, "ptr*", ppITextPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppVoid 
     * @returns {HRESULT} 
     */
    GetCallManager(ppVoid) {
        result := ComCall(48, this, "ptr*", ppVoid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pVoid 
     * @returns {HRESULT} 
     */
    ReleaseCallManager(pVoid) {
        result := ComCall(49, this, "ptr", pVoid, "HRESULT")
        return result
    }
}
