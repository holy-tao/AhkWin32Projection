#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Security\Authorization\TRUSTEE_W.ahk" { TRUSTEE_W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISecurityInfo extends IUnknown {
    /**
     * The interface identifier for ISecurityInfo
     * @type {Guid}
     */
    static IID := Guid("{0c733aa4-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecurityInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentTrustee : IntPtr
        GetObjectTypes    : IntPtr
        GetPermissions    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecurityInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<TRUSTEE_W>} 
     */
    GetCurrentTrustee() {
        result := ComCall(3, this, "ptr*", &ppTrustee := 0, "HRESULT")
        return ppTrustee
    }

    /**
     * 
     * @param {Pointer<Integer>} cObjectTypes 
     * @param {Pointer<Pointer<Guid>>} rgObjectTypes 
     * @returns {HRESULT} 
     */
    GetObjectTypes(cObjectTypes, rgObjectTypes) {
        cObjectTypesMarshal := cObjectTypes is VarRef ? "uint*" : "ptr"
        rgObjectTypesMarshal := rgObjectTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, cObjectTypesMarshal, cObjectTypes, rgObjectTypesMarshal, rgObjectTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} _ObjectType 
     * @returns {Integer} 
     */
    GetPermissions(_ObjectType) {
        result := ComCall(5, this, Guid, _ObjectType, "uint*", &pPermissions := 0, "HRESULT")
        return pPermissions
    }

    Query(iid) {
        if (ISecurityInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentTrustee := CallbackCreate(GetMethod(implObj, "GetCurrentTrustee"), flags, 2)
        this.vtbl.GetObjectTypes := CallbackCreate(GetMethod(implObj, "GetObjectTypes"), flags, 3)
        this.vtbl.GetPermissions := CallbackCreate(GetMethod(implObj, "GetPermissions"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentTrustee)
        CallbackFree(this.vtbl.GetObjectTypes)
        CallbackFree(this.vtbl.GetPermissions)
    }
}
