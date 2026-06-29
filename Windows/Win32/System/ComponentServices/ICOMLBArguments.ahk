#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to activate the COM+ component load balancing service.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomlbarguments
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ICOMLBArguments extends IUnknown {
    /**
     * The interface identifier for ICOMLBArguments
     * @type {Guid}
     */
    static IID := Guid("{3a0f150f-8ee5-4b94-b40e-aef2f9e42ed2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICOMLBArguments interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCLSID       : IntPtr
        SetCLSID       : IntPtr
        GetMachineName : IntPtr
        SetMachineName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICOMLBArguments.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the object's CLSID.
     * @param {Pointer<Guid>} pCLSID A pointer to the object's CLSID.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomlbarguments-getclsid
     */
    GetCLSID(pCLSID) {
        result := ComCall(3, this, Guid.Ptr, pCLSID, "HRESULT")
        return result
    }

    /**
     * Sets the object's CLSID.
     * @param {Pointer<Guid>} pCLSID The object's CLSID.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomlbarguments-setclsid
     */
    SetCLSID(pCLSID) {
        result := ComCall(4, this, Guid.Ptr, pCLSID, "HRESULT")
        return result
    }

    /**
     * Retrieves the computer name for the load balancing server.
     * @param {Integer} cchSvr The object's machine name.
     * @param {PWSTR} szServerName The object's server name.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomlbarguments-getmachinename
     */
    GetMachineName(cchSvr, szServerName) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(5, this, "uint", cchSvr, "ptr", szServerName, "HRESULT")
        return result
    }

    /**
     * Sets the computer name for the load balancing server.
     * @param {Integer} cchSvr The object's machine name.
     * @param {PWSTR} szServerName The object's server name.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomlbarguments-setmachinename
     */
    SetMachineName(cchSvr, szServerName) {
        szServerName := szServerName is String ? StrPtr(szServerName) : szServerName

        result := ComCall(6, this, "uint", cchSvr, "ptr", szServerName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICOMLBArguments.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCLSID := CallbackCreate(GetMethod(implObj, "GetCLSID"), flags, 2)
        this.vtbl.SetCLSID := CallbackCreate(GetMethod(implObj, "SetCLSID"), flags, 2)
        this.vtbl.GetMachineName := CallbackCreate(GetMethod(implObj, "GetMachineName"), flags, 3)
        this.vtbl.SetMachineName := CallbackCreate(GetMethod(implObj, "SetMachineName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCLSID)
        CallbackFree(this.vtbl.SetCLSID)
        CallbackFree(this.vtbl.GetMachineName)
        CallbackFree(this.vtbl.SetMachineName)
    }
}
