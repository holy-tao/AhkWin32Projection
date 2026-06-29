#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct ITipAutoCompleteProvider extends IUnknown {
    /**
     * The interface identifier for ITipAutoCompleteProvider
     * @type {Guid}
     */
    static IID := Guid("{7c6cf46d-8404-46b9-ad33-f5b6036d4007}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITipAutoCompleteProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdatePendingText : IntPtr
        Show              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITipAutoCompleteProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrPendingText 
     * @returns {HRESULT} 
     */
    UpdatePendingText(bstrPendingText) {
        bstrPendingText := bstrPendingText is String ? BSTR.Alloc(bstrPendingText).Value : bstrPendingText

        result := ComCall(3, this, BSTR, bstrPendingText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    Show(fShow) {
        result := ComCall(4, this, BOOL, fShow, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITipAutoCompleteProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdatePendingText := CallbackCreate(GetMethod(implObj, "UpdatePendingText"), flags, 2)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdatePendingText)
        CallbackFree(this.vtbl.Show)
    }
}
