#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Security\Authorization\TRUSTEE_W.ahk" { TRUSTEE_W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SEC_OBJECT.ahk" { SEC_OBJECT }
#Import "..\..\Security\Authorization\EXPLICIT_ACCESS_W.ahk" { EXPLICIT_ACCESS_W }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IObjectAccessControl extends IUnknown {
    /**
     * The interface identifier for IObjectAccessControl
     * @type {Guid}
     */
    static IID := Guid("{0c733aa3-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectAccessControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetObjectAccessRights : IntPtr
        GetObjectOwner        : IntPtr
        IsObjectAccessAllowed : IntPtr
        SetObjectAccessRights : IntPtr
        SetObjectOwner        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectAccessControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<Integer>} pcAccessEntries 
     * @param {Pointer<Pointer<EXPLICIT_ACCESS_W>>} prgAccessEntries 
     * @returns {HRESULT} 
     */
    GetObjectAccessRights(pObject, pcAccessEntries, prgAccessEntries) {
        pcAccessEntriesMarshal := pcAccessEntries is VarRef ? "uint*" : "ptr"
        prgAccessEntriesMarshal := prgAccessEntries is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, SEC_OBJECT.Ptr, pObject, pcAccessEntriesMarshal, pcAccessEntries, prgAccessEntriesMarshal, prgAccessEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @returns {Pointer<TRUSTEE_W>} 
     */
    GetObjectOwner(pObject) {
        result := ComCall(4, this, SEC_OBJECT.Ptr, pObject, "ptr*", &ppOwner := 0, "HRESULT")
        return ppOwner
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<EXPLICIT_ACCESS_W>} pAccessEntry 
     * @returns {BOOL} 
     */
    IsObjectAccessAllowed(pObject, pAccessEntry) {
        result := ComCall(5, this, SEC_OBJECT.Ptr, pObject, EXPLICIT_ACCESS_W.Ptr, pAccessEntry, BOOL.Ptr, &pfResult := 0, "HRESULT")
        return pfResult
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Integer} cAccessEntries 
     * @param {Pointer<EXPLICIT_ACCESS_W>} prgAccessEntries 
     * @returns {HRESULT} 
     */
    SetObjectAccessRights(pObject, cAccessEntries, prgAccessEntries) {
        result := ComCall(6, this, SEC_OBJECT.Ptr, pObject, "uint", cAccessEntries, EXPLICIT_ACCESS_W.Ptr, prgAccessEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<TRUSTEE_W>} pOwner 
     * @returns {HRESULT} 
     */
    SetObjectOwner(pObject, pOwner) {
        result := ComCall(7, this, SEC_OBJECT.Ptr, pObject, TRUSTEE_W.Ptr, pOwner, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectAccessControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetObjectAccessRights := CallbackCreate(GetMethod(implObj, "GetObjectAccessRights"), flags, 4)
        this.vtbl.GetObjectOwner := CallbackCreate(GetMethod(implObj, "GetObjectOwner"), flags, 3)
        this.vtbl.IsObjectAccessAllowed := CallbackCreate(GetMethod(implObj, "IsObjectAccessAllowed"), flags, 4)
        this.vtbl.SetObjectAccessRights := CallbackCreate(GetMethod(implObj, "SetObjectAccessRights"), flags, 4)
        this.vtbl.SetObjectOwner := CallbackCreate(GetMethod(implObj, "SetObjectOwner"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetObjectAccessRights)
        CallbackFree(this.vtbl.GetObjectOwner)
        CallbackFree(this.vtbl.IsObjectAccessAllowed)
        CallbackFree(this.vtbl.SetObjectAccessRights)
        CallbackFree(this.vtbl.SetObjectOwner)
    }
}
