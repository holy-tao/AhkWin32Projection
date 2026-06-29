#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMDMRevoked interface retrieves the URL from which updated components can be downloaded, if a transfer fails with a revocation error.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmrevoked
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IWMDMRevoked extends IUnknown {
    /**
     * The interface identifier for IWMDMRevoked
     * @type {Guid}
     */
    static IID := Guid("{ebeccedb-88ee-4e55-b6a4-8d9f07d696aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDMRevoked interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRevocationURL : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDMRevoked.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetRevocationURL method retrieves the URL from which updated components can be downloaded. (IWMDMRevoked.GetRevocationURL)
     * @remarks
     * This method retrieves the URL from which updated components can be downloaded. If this method is not implemented by the revoked component, a default Microsoft URL is used. This location is maintained by Microsoft and contains any updates to components revoked by the Microsoft digital rights management system.
     * @param {Pointer<PWSTR>} ppwszRevocationURL Pointer to a string containing a revocation URL. This buffer is created and freed by the caller.
     * @param {Pointer<Integer>} pdwBufferLen Size of the buffer holding the revocation URL.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmrevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        ppwszRevocationURLMarshal := ppwszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppwszRevocationURLMarshal, ppwszRevocationURL, pdwBufferLenMarshal, pdwBufferLen, "uint*", &pdwRevokedBitFlag := 0, "HRESULT")
        return pdwRevokedBitFlag
    }

    Query(iid) {
        if (IWMDMRevoked.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRevocationURL := CallbackCreate(GetMethod(implObj, "GetRevocationURL"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRevocationURL)
    }
}
