#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMDSPRevoked interface retrieves the URL from which updated components can be downloaded. Implementing this interface is optional. For more information, see Mandatory and Optional Interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdsprevoked
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPRevoked extends IUnknown {
    /**
     * The interface identifier for IMDSPRevoked
     * @type {Guid}
     */
    static IID := Guid("{a4e8f2d4-3f31-464d-b53d-4fc335998184}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPRevoked interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRevocationURL : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPRevoked.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetRevocationURL method retrieves the URL from which updated components can be downloaded. (IMDSPRevoked.GetRevocationURL)
     * @remarks
     * The <b>IMDSPRevoked</b> interface retrieves the URL from which updated components can be downloaded if the service provider is ever revoked by any digital rights management system. If this method is not implemented, a default Microsoft URL will be used. This location is maintained by Microsoft and contains updates to components revoked by the Microsoft digital rights management system.
     * @param {Pointer<PWSTR>} ppwszRevocationURL Pointer to a Unicode string where the revocation URL should be written.
     * @param {Pointer<Integer>} pdwBufferLen Number of <b>WCHAR</b> characters that the buffer supplied by the client can hold; on return it contains the required number of characters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdsprevoked-getrevocationurl
     */
    GetRevocationURL(ppwszRevocationURL, pdwBufferLen) {
        ppwszRevocationURLMarshal := ppwszRevocationURL is VarRef ? "ptr*" : "ptr"
        pdwBufferLenMarshal := pdwBufferLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppwszRevocationURLMarshal, ppwszRevocationURL, pdwBufferLenMarshal, pdwBufferLen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMDSPRevoked.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRevocationURL := CallbackCreate(GetMethod(implObj, "GetRevocationURL"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRevocationURL)
    }
}
