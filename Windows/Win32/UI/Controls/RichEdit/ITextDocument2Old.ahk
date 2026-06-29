#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITextPara.ahk" { ITextPara }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextFont.ahk" { ITextFont }
#Import ".\ITextDocument.ahk" { ITextDocument }
#Import "..\..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITextSelection.ahk" { ITextSelection }

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct ITextDocument2Old extends ITextDocument {
    /**
     * The interface identifier for ITextDocument2Old
     * @type {Guid}
     */
    static IID := Guid("{01c25500-4268-11d1-883a-3c8b00c10000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextDocument2Old interfaces
    */
    struct Vtbl extends ITextDocument.Vtbl {
        AttachMsgFilter     : IntPtr
        SetEffectColor      : IntPtr
        GetEffectColor      : IntPtr
        GetCaretType        : IntPtr
        SetCaretType        : IntPtr
        GetImmContext       : IntPtr
        ReleaseImmContext   : IntPtr
        GetPreferredFont    : IntPtr
        GetNotificationMode : IntPtr
        SetNotificationMode : IntPtr
        GetClientRect       : IntPtr
        GetSelection2       : IntPtr
        GetWindow           : IntPtr
        GetFEFlags          : IntPtr
        UpdateWindow        : IntPtr
        CheckTextLimit      : IntPtr
        IMEInProgress       : IntPtr
        SysBeep             : IntPtr
        Update              : IntPtr
        Notify              : IntPtr
        GetDocumentFont     : IntPtr
        GetDocumentPara     : IntPtr
        GetCallManager      : IntPtr
        ReleaseCallManager  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextDocument2Old.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(27, this, "int", Index, COLORREF, cr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {COLORREF} 
     */
    GetEffectColor(Index) {
        result := ComCall(28, this, "int", Index, COLORREF.Ptr, &pcr := 0, "HRESULT")
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

        result := ComCall(33, this, "int", cp, "int", CharRep, "int", Option, "int", CharRepCur, "int", curFontSize, BSTR.Ptr, pbstr, pPitchAndFamilyMarshal, pPitchAndFamily, pNewFontSizeMarshal, pNewFontSize, "HRESULT")
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

    Query(iid) {
        if (ITextDocument2Old.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AttachMsgFilter := CallbackCreate(GetMethod(implObj, "AttachMsgFilter"), flags, 2)
        this.vtbl.SetEffectColor := CallbackCreate(GetMethod(implObj, "SetEffectColor"), flags, 3)
        this.vtbl.GetEffectColor := CallbackCreate(GetMethod(implObj, "GetEffectColor"), flags, 3)
        this.vtbl.GetCaretType := CallbackCreate(GetMethod(implObj, "GetCaretType"), flags, 2)
        this.vtbl.SetCaretType := CallbackCreate(GetMethod(implObj, "SetCaretType"), flags, 2)
        this.vtbl.GetImmContext := CallbackCreate(GetMethod(implObj, "GetImmContext"), flags, 2)
        this.vtbl.ReleaseImmContext := CallbackCreate(GetMethod(implObj, "ReleaseImmContext"), flags, 2)
        this.vtbl.GetPreferredFont := CallbackCreate(GetMethod(implObj, "GetPreferredFont"), flags, 9)
        this.vtbl.GetNotificationMode := CallbackCreate(GetMethod(implObj, "GetNotificationMode"), flags, 2)
        this.vtbl.SetNotificationMode := CallbackCreate(GetMethod(implObj, "SetNotificationMode"), flags, 2)
        this.vtbl.GetClientRect := CallbackCreate(GetMethod(implObj, "GetClientRect"), flags, 6)
        this.vtbl.GetSelection2 := CallbackCreate(GetMethod(implObj, "GetSelection2"), flags, 2)
        this.vtbl.GetWindow := CallbackCreate(GetMethod(implObj, "GetWindow"), flags, 2)
        this.vtbl.GetFEFlags := CallbackCreate(GetMethod(implObj, "GetFEFlags"), flags, 2)
        this.vtbl.UpdateWindow := CallbackCreate(GetMethod(implObj, "UpdateWindow"), flags, 1)
        this.vtbl.CheckTextLimit := CallbackCreate(GetMethod(implObj, "CheckTextLimit"), flags, 3)
        this.vtbl.IMEInProgress := CallbackCreate(GetMethod(implObj, "IMEInProgress"), flags, 2)
        this.vtbl.SysBeep := CallbackCreate(GetMethod(implObj, "SysBeep"), flags, 1)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 2)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 2)
        this.vtbl.GetDocumentFont := CallbackCreate(GetMethod(implObj, "GetDocumentFont"), flags, 2)
        this.vtbl.GetDocumentPara := CallbackCreate(GetMethod(implObj, "GetDocumentPara"), flags, 2)
        this.vtbl.GetCallManager := CallbackCreate(GetMethod(implObj, "GetCallManager"), flags, 2)
        this.vtbl.ReleaseCallManager := CallbackCreate(GetMethod(implObj, "ReleaseCallManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AttachMsgFilter)
        CallbackFree(this.vtbl.SetEffectColor)
        CallbackFree(this.vtbl.GetEffectColor)
        CallbackFree(this.vtbl.GetCaretType)
        CallbackFree(this.vtbl.SetCaretType)
        CallbackFree(this.vtbl.GetImmContext)
        CallbackFree(this.vtbl.ReleaseImmContext)
        CallbackFree(this.vtbl.GetPreferredFont)
        CallbackFree(this.vtbl.GetNotificationMode)
        CallbackFree(this.vtbl.SetNotificationMode)
        CallbackFree(this.vtbl.GetClientRect)
        CallbackFree(this.vtbl.GetSelection2)
        CallbackFree(this.vtbl.GetWindow)
        CallbackFree(this.vtbl.GetFEFlags)
        CallbackFree(this.vtbl.UpdateWindow)
        CallbackFree(this.vtbl.CheckTextLimit)
        CallbackFree(this.vtbl.IMEInProgress)
        CallbackFree(this.vtbl.SysBeep)
        CallbackFree(this.vtbl.Update)
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.GetDocumentFont)
        CallbackFree(this.vtbl.GetDocumentPara)
        CallbackFree(this.vtbl.GetCallManager)
        CallbackFree(this.vtbl.ReleaseCallManager)
    }
}
