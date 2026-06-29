#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPROPIDSET.ahk" { DBPROPIDSET }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetInfo extends IUnknown {
    /**
     * The interface identifier for IRowsetInfo
     * @type {Guid}
     */
    static IID := Guid("{0c733a55-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties       : IntPtr
        GetReferencedRowset : IntPtr
        GetSpecification    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgPropertySets 
     * @returns {HRESULT} 
     */
    GetProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertySets, prgPropertySets) {
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : "ptr"
        prgPropertySetsMarshal := prgPropertySets is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", cPropertyIDSets, DBPROPIDSET.Ptr, rgPropertyIDSets, pcPropertySetsMarshal, pcPropertySets, prgPropertySetsMarshal, prgPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} iOrdinal 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetReferencedRowset(iOrdinal, riid) {
        result := ComCall(4, this, "ptr", iOrdinal, Guid.Ptr, riid, "ptr*", &ppReferencedRowset := 0, "HRESULT")
        return IUnknown(ppReferencedRowset)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetSpecification(riid) {
        result := ComCall(5, this, Guid.Ptr, riid, "ptr*", &ppSpecification := 0, "HRESULT")
        return IUnknown(ppSpecification)
    }

    Query(iid) {
        if (IRowsetInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 5)
        this.vtbl.GetReferencedRowset := CallbackCreate(GetMethod(implObj, "GetReferencedRowset"), flags, 4)
        this.vtbl.GetSpecification := CallbackCreate(GetMethod(implObj, "GetSpecification"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetReferencedRowset)
        CallbackFree(this.vtbl.GetSpecification)
    }
}
