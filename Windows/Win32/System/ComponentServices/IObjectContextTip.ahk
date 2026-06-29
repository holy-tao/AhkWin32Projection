#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves properties describing the Transaction Internet Protocol (TIP) transaction context.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectcontexttip
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectContextTip extends IUnknown {
    /**
     * The interface identifier for IObjectContextTip
     * @type {Guid}
     */
    static IID := Guid("{92fd41ca-bad9-11d2-9a2d-00c04f797bc9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectContextTip interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTipUrl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectContextTip.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the URL of the TIP context.
     * @param {Pointer<BSTR>} pTipUrl The URL of the TIP transaction context, or <b>NULL</b> if the transaction context does not exist.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontexttip-gettipurl
     */
    GetTipUrl(pTipUrl) {
        result := ComCall(3, this, BSTR.Ptr, pTipUrl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectContextTip.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTipUrl := CallbackCreate(GetMethod(implObj, "GetTipUrl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTipUrl)
    }
}
