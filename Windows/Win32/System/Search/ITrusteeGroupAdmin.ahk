#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Security\Authorization\TRUSTEE_W.ahk" { TRUSTEE_W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITrusteeGroupAdmin extends IUnknown {
    /**
     * The interface identifier for ITrusteeGroupAdmin
     * @type {Guid}
     */
    static IID := Guid("{0c733aa2-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITrusteeGroupAdmin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddMember      : IntPtr
        DeleteMember   : IntPtr
        IsMember       : IntPtr
        GetMembers     : IntPtr
        GetMemberships : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITrusteeGroupAdmin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<TRUSTEE_W>} pMemberTrustee 
     * @returns {HRESULT} 
     */
    AddMember(pMembershipTrustee, pMemberTrustee) {
        result := ComCall(3, this, TRUSTEE_W.Ptr, pMembershipTrustee, TRUSTEE_W.Ptr, pMemberTrustee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<TRUSTEE_W>} pMemberTrustee 
     * @returns {HRESULT} 
     */
    DeleteMember(pMembershipTrustee, pMemberTrustee) {
        result := ComCall(4, this, TRUSTEE_W.Ptr, pMembershipTrustee, TRUSTEE_W.Ptr, pMemberTrustee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<TRUSTEE_W>} pMemberTrustee 
     * @returns {BOOL} 
     */
    IsMember(pMembershipTrustee, pMemberTrustee) {
        result := ComCall(5, this, TRUSTEE_W.Ptr, pMembershipTrustee, TRUSTEE_W.Ptr, pMemberTrustee, BOOL.Ptr, &pfStatus := 0, "HRESULT")
        return pfStatus
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<Integer>} pcMembers 
     * @param {Pointer<Pointer<TRUSTEE_W>>} prgMembers 
     * @returns {HRESULT} 
     */
    GetMembers(pMembershipTrustee, pcMembers, prgMembers) {
        pcMembersMarshal := pcMembers is VarRef ? "uint*" : "ptr"
        prgMembersMarshal := prgMembers is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, TRUSTEE_W.Ptr, pMembershipTrustee, pcMembersMarshal, pcMembers, prgMembersMarshal, prgMembers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Pointer<Integer>} pcMemberships 
     * @param {Pointer<Pointer<TRUSTEE_W>>} prgMemberships 
     * @returns {HRESULT} 
     */
    GetMemberships(pTrustee, pcMemberships, prgMemberships) {
        pcMembershipsMarshal := pcMemberships is VarRef ? "uint*" : "ptr"
        prgMembershipsMarshal := prgMemberships is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, TRUSTEE_W.Ptr, pTrustee, pcMembershipsMarshal, pcMemberships, prgMembershipsMarshal, prgMemberships, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITrusteeGroupAdmin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddMember := CallbackCreate(GetMethod(implObj, "AddMember"), flags, 3)
        this.vtbl.DeleteMember := CallbackCreate(GetMethod(implObj, "DeleteMember"), flags, 3)
        this.vtbl.IsMember := CallbackCreate(GetMethod(implObj, "IsMember"), flags, 4)
        this.vtbl.GetMembers := CallbackCreate(GetMethod(implObj, "GetMembers"), flags, 4)
        this.vtbl.GetMemberships := CallbackCreate(GetMethod(implObj, "GetMemberships"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddMember)
        CallbackFree(this.vtbl.DeleteMember)
        CallbackFree(this.vtbl.IsMember)
        CallbackFree(this.vtbl.GetMembers)
        CallbackFree(this.vtbl.GetMemberships)
    }
}
