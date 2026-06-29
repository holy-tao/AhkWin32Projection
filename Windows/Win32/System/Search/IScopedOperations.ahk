#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IAuthenticate.ahk" { IAuthenticate }
#Import ".\IBindResource.ahk" { IBindResource }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPROPSET.ahk" { DBPROPSET }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IScopedOperations extends IBindResource {
    /**
     * The interface identifier for IScopedOperations
     * @type {Guid}
     */
    static IID := Guid("{0c733ab0-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScopedOperations interfaces
    */
    struct Vtbl extends IBindResource.Vtbl {
        Copy       : IntPtr
        Move       : IntPtr
        Delete     : IntPtr
        OpenRowset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScopedOperations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwCopyFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    Copy(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwCopyFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgpwszSourceURLsMarshal := rgpwszSourceURLs is VarRef ? "ptr*" : "ptr"
        rgpwszDestURLsMarshal := rgpwszDestURLs is VarRef ? "ptr*" : "ptr"
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        rgpwszNewURLsMarshal := rgpwszNewURLs is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cRows, rgpwszSourceURLsMarshal, rgpwszSourceURLs, rgpwszDestURLsMarshal, rgpwszDestURLs, "uint", dwCopyFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, rgpwszNewURLsMarshal, rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwMoveFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    Move(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwMoveFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgpwszSourceURLsMarshal := rgpwszSourceURLs is VarRef ? "ptr*" : "ptr"
        rgpwszDestURLsMarshal := rgpwszDestURLs is VarRef ? "ptr*" : "ptr"
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        rgpwszNewURLsMarshal := rgpwszNewURLs is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cRows, rgpwszSourceURLsMarshal, rgpwszSourceURLs, rgpwszDestURLsMarshal, rgpwszDestURLs, "uint", dwMoveFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, rgpwszNewURLsMarshal, rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszURLs 
     * @param {Integer} dwDeleteFlags 
     * @returns {Integer} 
     */
    Delete(cRows, rgpwszURLs, dwDeleteFlags) {
        rgpwszURLsMarshal := rgpwszURLs is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, rgpwszURLsMarshal, rgpwszURLs, "uint", dwDeleteFlags, "uint*", &rgdwStatus := 0, "HRESULT")
        return rgdwStatus
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    OpenRowset(pUnkOuter, pTableID, pIndexID, riid, cPropertySets, rgPropertySets) {
        result := ComCall(7, this, "ptr", pUnkOuter, DBID.Ptr, pTableID, DBID.Ptr, pIndexID, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }

    Query(iid) {
        if (IScopedOperations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 9)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 9)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 5)
        this.vtbl.OpenRowset := CallbackCreate(GetMethod(implObj, "OpenRowset"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.OpenRowset)
    }
}
