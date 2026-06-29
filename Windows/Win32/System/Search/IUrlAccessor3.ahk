#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\BLOB.ahk" { BLOB }
#Import ".\IUrlAccessor2.ahk" { IUrlAccessor2 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the functionality of the IUrlAccessor2 interface with the IUrlAccessor3::GetImpersonationSidBlobs method to identify user security identifiers (SIDs) for a specified URL.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-iurlaccessor3
 * @namespace Windows.Win32.System.Search
 */
export default struct IUrlAccessor3 extends IUrlAccessor2 {
    /**
     * The interface identifier for IUrlAccessor3
     * @type {Guid}
     */
    static IID := Guid("{6fbc7005-0455-4874-b8ff-7439450241a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUrlAccessor3 interfaces
    */
    struct Vtbl extends IUrlAccessor2.Vtbl {
        GetImpersonationSidBlobs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUrlAccessor3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an array of user security identifiers (SIDs) for a specified URL. This method enables protocol handlers to specify which users can access the file and the search protocol host to impersonate a user in order to index the file.
     * @remarks
     * If the file is encrypted, this method identifies who can both decrypt and access it. If the method cannot identify this information, it fails with error code E_ACCESSDENIED.
     *             
     * 
     * This method assumes that the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor2">IUrlAccessor2</a> object failed to initialize and returned the code <a href="https://docs.microsoft.com/windows/desktop/search/-search-prth-error-constants">PRTH_S_TRY_IMPERSONATING</a>. Then, the search protocol host calls this method to retrieve a list of SIDs to use for impersonation and reverts to using <b>IUrlAccessor2</b>, impersonating one of the allowed users when opening the item.
     * 
     * Impersonating a user does not elevate the caller's privileges. If the caller cannot directly retrieve the list of users authorized to access a resource, the caller won't be able to do that with this method, either. Only the search protocol host and the indexer have adequate privileges to impersonate users currently logged on.
     * @param {PWSTR} pcwszURL Type: <b>LPCWSTR</b>
     * 
     * The URL to access on behalf of an impersonated user.
     * @param {Pointer<Integer>} pcSidCount Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of user SIDs returned in <i>ppSidBlobs</i>.
     * @param {Pointer<Pointer<BLOB>>} ppSidBlobs Type: <b>BLOB**</b>
     * 
     * Receives the address of a pointer to the array of candidate impersonation user SIDs.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor3-getimpersonationsidblobs
     */
    GetImpersonationSidBlobs(pcwszURL, pcSidCount, ppSidBlobs) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        pcSidCountMarshal := pcSidCount is VarRef ? "uint*" : "ptr"
        ppSidBlobsMarshal := ppSidBlobs is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "ptr", pcwszURL, pcSidCountMarshal, pcSidCount, ppSidBlobsMarshal, ppSidBlobs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUrlAccessor3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImpersonationSidBlobs := CallbackCreate(GetMethod(implObj, "GetImpersonationSidBlobs"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImpersonationSidBlobs)
    }
}
