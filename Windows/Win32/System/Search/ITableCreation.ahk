#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITableDefinition.ahk" { ITableDefinition }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBCONSTRAINTDESC.ahk" { DBCONSTRAINTDESC }
#Import ".\DBCOLUMNDESC.ahk" { DBCOLUMNDESC }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITableCreation extends ITableDefinition {
    /**
     * The interface identifier for ITableCreation
     * @type {Guid}
     */
    static IID := Guid("{0c733abc-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITableCreation interfaces
    */
    struct Vtbl extends ITableDefinition.Vtbl {
        GetTableDefinition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITableCreation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<Pointer>} pcColumnDescs 
     * @param {Pointer<Pointer<DBCOLUMNDESC>>} prgColumnDescs 
     * @param {Pointer<Integer>} pcPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgPropertySets 
     * @param {Pointer<Integer>} pcConstraintDescs 
     * @param {Pointer<Pointer<DBCONSTRAINTDESC>>} prgConstraintDescs 
     * @param {Pointer<Pointer<Integer>>} ppwszStringBuffer 
     * @returns {HRESULT} 
     */
    GetTableDefinition(pTableID, pcColumnDescs, prgColumnDescs, pcPropertySets, prgPropertySets, pcConstraintDescs, prgConstraintDescs, ppwszStringBuffer) {
        pcColumnDescsMarshal := pcColumnDescs is VarRef ? "ptr*" : "ptr"
        prgColumnDescsMarshal := prgColumnDescs is VarRef ? "ptr*" : "ptr"
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : "ptr"
        prgPropertySetsMarshal := prgPropertySets is VarRef ? "ptr*" : "ptr"
        pcConstraintDescsMarshal := pcConstraintDescs is VarRef ? "uint*" : "ptr"
        prgConstraintDescsMarshal := prgConstraintDescs is VarRef ? "ptr*" : "ptr"
        ppwszStringBufferMarshal := ppwszStringBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, DBID.Ptr, pTableID, pcColumnDescsMarshal, pcColumnDescs, prgColumnDescsMarshal, prgColumnDescs, pcPropertySetsMarshal, pcPropertySets, prgPropertySetsMarshal, prgPropertySets, pcConstraintDescsMarshal, pcConstraintDescs, prgConstraintDescsMarshal, prgConstraintDescs, ppwszStringBufferMarshal, ppwszStringBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITableCreation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTableDefinition := CallbackCreate(GetMethod(implObj, "GetTableDefinition"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTableDefinition)
    }
}
