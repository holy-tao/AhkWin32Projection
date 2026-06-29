#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBPROPINFOSET.ahk" { DBPROPINFOSET }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBPROPIDSET.ahk" { DBPROPIDSET }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IDBDataSourceAdmin extends IUnknown {
    /**
     * The interface identifier for IDBDataSourceAdmin
     * @type {Guid}
     */
    static IID := Guid("{0c733a7a-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDBDataSourceAdmin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDataSource      : IntPtr
        DestroyDataSource     : IntPtr
        GetCreationProperties : IntPtr
        ModifyDataSource      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDBDataSourceAdmin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    CreateDataSource(cPropertySets, rgPropertySets, pUnkOuter, riid) {
        result := ComCall(3, this, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "ptr", pUnkOuter, Guid.Ptr, riid, "ptr*", &ppDBSession := 0, "HRESULT")
        return IUnknown(ppDBSession)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DestroyDataSource() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertyInfoSets 
     * @param {Pointer<Pointer<DBPROPINFOSET>>} prgPropertyInfoSets 
     * @param {Pointer<Pointer<Integer>>} ppDescBuffer 
     * @returns {HRESULT} 
     */
    GetCreationProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertyInfoSets, prgPropertyInfoSets, ppDescBuffer) {
        pcPropertyInfoSetsMarshal := pcPropertyInfoSets is VarRef ? "uint*" : "ptr"
        prgPropertyInfoSetsMarshal := prgPropertyInfoSets is VarRef ? "ptr*" : "ptr"
        ppDescBufferMarshal := ppDescBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", cPropertyIDSets, DBPROPIDSET.Ptr, rgPropertyIDSets, pcPropertyInfoSetsMarshal, pcPropertyInfoSets, prgPropertyInfoSetsMarshal, prgPropertyInfoSets, ppDescBufferMarshal, ppDescBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    ModifyDataSource(cPropertySets, rgPropertySets) {
        result := ComCall(6, this, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDBDataSourceAdmin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDataSource := CallbackCreate(GetMethod(implObj, "CreateDataSource"), flags, 6)
        this.vtbl.DestroyDataSource := CallbackCreate(GetMethod(implObj, "DestroyDataSource"), flags, 1)
        this.vtbl.GetCreationProperties := CallbackCreate(GetMethod(implObj, "GetCreationProperties"), flags, 6)
        this.vtbl.ModifyDataSource := CallbackCreate(GetMethod(implObj, "ModifyDataSource"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDataSource)
        CallbackFree(this.vtbl.DestroyDataSource)
        CallbackFree(this.vtbl.GetCreationProperties)
        CallbackFree(this.vtbl.ModifyDataSource)
    }
}
