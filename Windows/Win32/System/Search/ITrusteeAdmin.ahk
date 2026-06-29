#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Security\Authorization\TRUSTEE_W.ahk" { TRUSTEE_W }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPROPIDSET.ahk" { DBPROPIDSET }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITrusteeAdmin extends IUnknown {
    /**
     * The interface identifier for ITrusteeAdmin
     * @type {Guid}
     */
    static IID := Guid("{0c733aa1-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITrusteeAdmin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CompareTrustees      : IntPtr
        CreateTrustee        : IntPtr
        DeleteTrustee        : IntPtr
        SetTrusteeProperties : IntPtr
        GetTrusteeProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITrusteeAdmin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee1 
     * @param {Pointer<TRUSTEE_W>} pTrustee2 
     * @returns {HRESULT} 
     */
    CompareTrustees(pTrustee1, pTrustee2) {
        result := ComCall(3, this, TRUSTEE_W.Ptr, pTrustee1, TRUSTEE_W.Ptr, pTrustee2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    CreateTrustee(pTrustee, cPropertySets, rgPropertySets) {
        result := ComCall(4, this, TRUSTEE_W.Ptr, pTrustee, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @returns {HRESULT} 
     */
    DeleteTrustee(pTrustee) {
        result := ComCall(5, this, TRUSTEE_W.Ptr, pTrustee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    SetTrusteeProperties(pTrustee, cPropertySets, rgPropertySets) {
        result := ComCall(6, this, TRUSTEE_W.Ptr, pTrustee, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertySets 
     * @returns {Pointer<DBPROPSET>} 
     */
    GetTrusteeProperties(pTrustee, cPropertyIDSets, rgPropertyIDSets, pcPropertySets) {
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, TRUSTEE_W.Ptr, pTrustee, "uint", cPropertyIDSets, DBPROPIDSET.Ptr, rgPropertyIDSets, pcPropertySetsMarshal, pcPropertySets, "ptr*", &prgPropertySets := 0, "HRESULT")
        return prgPropertySets
    }

    Query(iid) {
        if (ITrusteeAdmin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompareTrustees := CallbackCreate(GetMethod(implObj, "CompareTrustees"), flags, 3)
        this.vtbl.CreateTrustee := CallbackCreate(GetMethod(implObj, "CreateTrustee"), flags, 4)
        this.vtbl.DeleteTrustee := CallbackCreate(GetMethod(implObj, "DeleteTrustee"), flags, 2)
        this.vtbl.SetTrusteeProperties := CallbackCreate(GetMethod(implObj, "SetTrusteeProperties"), flags, 4)
        this.vtbl.GetTrusteeProperties := CallbackCreate(GetMethod(implObj, "GetTrusteeProperties"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompareTrustees)
        CallbackFree(this.vtbl.CreateTrustee)
        CallbackFree(this.vtbl.DeleteTrustee)
        CallbackFree(this.vtbl.SetTrusteeProperties)
        CallbackFree(this.vtbl.GetTrusteeProperties)
    }
}
