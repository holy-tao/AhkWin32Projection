#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IMDFind extends IUnknown {
    /**
     * The interface identifier for IMDFind
     * @type {Guid}
     */
    static IID := Guid("{a07cccd2-8148-11d0-87bb-00c04fc33942}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDFind interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindCell  : IntPtr
        FindTuple : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDFind.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @returns {Pointer} 
     */
    FindCell(ulStartingOrdinal, cMembers, rgpwszMember) {
        rgpwszMemberMarshal := rgpwszMember is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ulStartingOrdinal, "ptr", cMembers, rgpwszMemberMarshal, rgpwszMember, "ptr*", &pulCellOrdinal := 0, "HRESULT")
        return pulCellOrdinal
    }

    /**
     * 
     * @param {Integer} ulAxisIdentifier 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @returns {Integer} 
     */
    FindTuple(ulAxisIdentifier, ulStartingOrdinal, cMembers, rgpwszMember) {
        rgpwszMemberMarshal := rgpwszMember is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", ulAxisIdentifier, "ptr", ulStartingOrdinal, "ptr", cMembers, rgpwszMemberMarshal, rgpwszMember, "uint*", &pulTupleOrdinal := 0, "HRESULT")
        return pulTupleOrdinal
    }

    Query(iid) {
        if (IMDFind.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindCell := CallbackCreate(GetMethod(implObj, "FindCell"), flags, 5)
        this.vtbl.FindTuple := CallbackCreate(GetMethod(implObj, "FindTuple"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindCell)
        CallbackFree(this.vtbl.FindTuple)
    }
}
