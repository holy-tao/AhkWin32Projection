#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITipAutoCompleteProvider.ahk" { ITipAutoCompleteProvider }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct ITipAutoCompleteClient extends IUnknown {
    /**
     * The interface identifier for ITipAutoCompleteClient
     * @type {Guid}
     */
    static IID := Guid("{5e078e03-8265-4bbe-9487-d242edbef910}")

    /**
     * The class identifier for TipAutoCompleteClient
     * @type {Guid}
     */
    static CLSID := Guid("{807c1e6c-1d00-453f-b920-b61bb7cdd997}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITipAutoCompleteClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AdviseProvider   : IntPtr
        UnadviseProvider : IntPtr
        UserSelection    : IntPtr
        PreferredRects   : IntPtr
        RequestShowUI    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITipAutoCompleteClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} hWndField 
     * @param {ITipAutoCompleteProvider} pIProvider 
     * @returns {HRESULT} 
     */
    AdviseProvider(hWndField, pIProvider) {
        result := ComCall(3, this, HWND, hWndField, "ptr", pIProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndField 
     * @param {ITipAutoCompleteProvider} pIProvider 
     * @returns {HRESULT} 
     */
    UnadviseProvider(hWndField, pIProvider) {
        result := ComCall(4, this, HWND, hWndField, "ptr", pIProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UserSelection() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcACList 
     * @param {Pointer<RECT>} prcField 
     * @param {Pointer<RECT>} prcModifiedACList 
     * @param {Pointer<BOOL>} pfShownAboveTip 
     * @returns {HRESULT} 
     */
    PreferredRects(prcACList, prcField, prcModifiedACList, pfShownAboveTip) {
        pfShownAboveTipMarshal := pfShownAboveTip is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, RECT.Ptr, prcACList, RECT.Ptr, prcField, RECT.Ptr, prcModifiedACList, pfShownAboveTipMarshal, pfShownAboveTip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndList 
     * @returns {BOOL} 
     */
    RequestShowUI(hWndList) {
        result := ComCall(7, this, HWND, hWndList, BOOL.Ptr, &pfAllowShowing := 0, "HRESULT")
        return pfAllowShowing
    }

    Query(iid) {
        if (ITipAutoCompleteClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AdviseProvider := CallbackCreate(GetMethod(implObj, "AdviseProvider"), flags, 3)
        this.vtbl.UnadviseProvider := CallbackCreate(GetMethod(implObj, "UnadviseProvider"), flags, 3)
        this.vtbl.UserSelection := CallbackCreate(GetMethod(implObj, "UserSelection"), flags, 1)
        this.vtbl.PreferredRects := CallbackCreate(GetMethod(implObj, "PreferredRects"), flags, 5)
        this.vtbl.RequestShowUI := CallbackCreate(GetMethod(implObj, "RequestShowUI"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AdviseProvider)
        CallbackFree(this.vtbl.UnadviseProvider)
        CallbackFree(this.vtbl.UserSelection)
        CallbackFree(this.vtbl.PreferredRects)
        CallbackFree(this.vtbl.RequestShowUI)
    }
}
