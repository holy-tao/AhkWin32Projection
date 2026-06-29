#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBCONSTRAINTDESC.ahk" { DBCONSTRAINTDESC }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBCOLUMNDESC.ahk" { DBCOLUMNDESC }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import ".\ITableCreation.ahk" { ITableCreation }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITableDefinitionWithConstraints extends ITableCreation {
    /**
     * The interface identifier for ITableDefinitionWithConstraints
     * @type {Guid}
     */
    static IID := Guid("{0c733aab-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITableDefinitionWithConstraints interfaces
    */
    struct Vtbl extends ITableCreation.Vtbl {
        AddConstraint              : IntPtr
        CreateTableWithConstraints : IntPtr
        DropConstraint             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITableDefinitionWithConstraints.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBCONSTRAINTDESC>} pConstraintDesc 
     * @returns {HRESULT} 
     */
    AddConstraint(pTableID, pConstraintDesc) {
        result := ComCall(8, this, DBID.Ptr, pTableID, DBCONSTRAINTDESC.Ptr, pConstraintDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer} cColumnDescs 
     * @param {Pointer<DBCOLUMNDESC>} rgColumnDescs 
     * @param {Integer} cConstraintDescs 
     * @param {Pointer<DBCONSTRAINTDESC>} rgConstraintDescs 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<Pointer<DBID>>} ppTableID 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    CreateTableWithConstraints(pUnkOuter, pTableID, cColumnDescs, rgColumnDescs, cConstraintDescs, rgConstraintDescs, riid, cPropertySets, rgPropertySets, ppTableID, ppRowset) {
        ppTableIDMarshal := ppTableID is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pUnkOuter, DBID.Ptr, pTableID, "ptr", cColumnDescs, DBCOLUMNDESC.Ptr, rgColumnDescs, "uint", cConstraintDescs, DBCONSTRAINTDESC.Ptr, rgConstraintDescs, Guid.Ptr, riid, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, ppTableIDMarshal, ppTableID, IUnknown.Ptr, ppRowset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pConstraintID 
     * @returns {HRESULT} 
     */
    DropConstraint(pTableID, pConstraintID) {
        result := ComCall(10, this, DBID.Ptr, pTableID, DBID.Ptr, pConstraintID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITableDefinitionWithConstraints.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddConstraint := CallbackCreate(GetMethod(implObj, "AddConstraint"), flags, 3)
        this.vtbl.CreateTableWithConstraints := CallbackCreate(GetMethod(implObj, "CreateTableWithConstraints"), flags, 12)
        this.vtbl.DropConstraint := CallbackCreate(GetMethod(implObj, "DropConstraint"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddConstraint)
        CallbackFree(this.vtbl.CreateTableWithConstraints)
        CallbackFree(this.vtbl.DropConstraint)
    }
}
