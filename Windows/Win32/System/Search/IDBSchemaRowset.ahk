#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBSchemaRowset extends IUnknown {
    /**
     * The interface identifier for IDBSchemaRowset
     * @type {Guid}
     */
    static IID := Guid("{0c733a7b-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBSchemaRowset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRowset  : IntPtr
        GetSchemas : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBSchemaRowset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} rguidSchema 
     * @param {Integer} cRestrictions 
     * @param {Pointer<VARIANT>} rgRestrictions 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    GetRowset(pUnkOuter, rguidSchema, cRestrictions, rgRestrictions, riid, cPropertySets, rgPropertySets) {
        result := ComCall(3, this, "ptr", pUnkOuter, Guid.Ptr, rguidSchema, "uint", cRestrictions, VARIANT.Ptr, rgRestrictions, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "ptr*", &ppRowset := 0, "HRESULT")
        return IUnknown(ppRowset)
    }

    /**
     * 
     * @param {Pointer<Integer>} pcSchemas 
     * @param {Pointer<Pointer<Guid>>} prgSchemas 
     * @param {Pointer<Pointer<Integer>>} prgRestrictionSupport 
     * @returns {HRESULT} 
     */
    GetSchemas(pcSchemas, prgSchemas, prgRestrictionSupport) {
        pcSchemasMarshal := pcSchemas is VarRef ? "uint*" : "ptr"
        prgSchemasMarshal := prgSchemas is VarRef ? "ptr*" : "ptr"
        prgRestrictionSupportMarshal := prgRestrictionSupport is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcSchemasMarshal, pcSchemas, prgSchemasMarshal, prgSchemas, prgRestrictionSupportMarshal, prgRestrictionSupport, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDBSchemaRowset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRowset := CallbackCreate(GetMethod(implObj, "GetRowset"), flags, 9)
        this.vtbl.GetSchemas := CallbackCreate(GetMethod(implObj, "GetSchemas"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRowset)
        CallbackFree(this.vtbl.GetSchemas)
    }
}
