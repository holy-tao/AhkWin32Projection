#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Foundation\COLORREF.ahk
#Include .\ITextSelection.ahk
#Include .\ITextFont.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\ITextPara.ahk
#Include .\ITextDocument.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class ITextDocument2Old extends ITextDocument {

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
     * @returns {COLORREF} 
     */
    GetEffectColor(Index) {
        result := ComCall(28, this, "int", Index, "uint*", &pcr := 0, "HRESULT")
        return pcr
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCaretType() {
        result := ComCall(29, this, "int*", &pCaretType := 0, "HRESULT")
        return pCaretType
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
     * @returns {Integer} 
     */
    GetImmContext() {
        result := ComCall(31, this, "int64*", &pContext := 0, "HRESULT")
        return pContext
    }

    /**
     * 
     * @param {Integer} _Context 
     * @returns {HRESULT} 
     */
    ReleaseImmContext(_Context) {
        result := ComCall(32, this, "int64", _Context, "HRESULT")
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
     * @returns {Integer} 
     */
    GetNotificationMode() {
        result := ComCall(34, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     */
    SetNotificationMode(_Mode) {
        result := ComCall(35, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * Retrieves the coordinates of a window's client area.
     * @remarks
     * In conformance with conventions for the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure, the bottom-right coordinates of the returned rectangle are exclusive. In other words, the pixel at (<b>right</b>, <b>bottom</b>) lies immediately outside the rectangle.
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pRight 
     * @param {Pointer<Integer>} pBottom 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclientrect
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
     * @returns {ITextSelection} 
     */
    GetSelection2() {
        result := ComCall(37, this, "ptr*", &ppSel := 0, "HRESULT")
        return ITextSelection(ppSel)
    }

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumchildwindows">EnumChildWindows</a> function is more reliable than calling <b>GetWindow</b> in a loop. An application that calls <b>GetWindow</b> to perform this task risks being caught in an infinite loop or referencing a handle to a window that has been destroyed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindow
     */
    GetWindow() {
        result := ComCall(38, this, "int*", &phWnd := 0, "HRESULT")
        return phWnd
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFEFlags() {
        result := ComCall(39, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * The UpdateWindow function updates the client area of the specified window by sending a WM_PAINT message to the window if the window's update region is not empty.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-updatewindow
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
     * Learn more about: Update constructor
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/update-constructor
     */
    Update(_Mode) {
        result := ComCall(44, this, "int", _Mode, "HRESULT")
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
     * @returns {ITextFont} 
     */
    GetDocumentFont() {
        result := ComCall(46, this, "ptr*", &ppITextFont := 0, "HRESULT")
        return ITextFont(ppITextFont)
    }

    /**
     * 
     * @returns {ITextPara} 
     */
    GetDocumentPara() {
        result := ComCall(47, this, "ptr*", &ppITextPara := 0, "HRESULT")
        return ITextPara(ppITextPara)
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    GetCallManager() {
        result := ComCall(48, this, "ptr*", &ppVoid := 0, "HRESULT")
        return IUnknown(ppVoid)
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
