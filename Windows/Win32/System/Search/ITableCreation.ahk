#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import ".\DBCOLUMNDESC.ahk" { DBCOLUMNDESC }
#Import ".\DBCONSTRAINTDESC.ahk" { DBCONSTRAINTDESC }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import ".\ITableDefinition.ahk" { ITableDefinition }

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
        pcColumnDescsMarshal := pcColumnDescs is VarRef ? "ptr*" : IntPtr
        pcColumnDescsMarshal := pcColumnDescs == 0 ? IntPtr : "ptr*"
        prgColumnDescsMarshal := prgColumnDescs is VarRef ? "ptr*" : IntPtr
        prgColumnDescsMarshal := prgColumnDescs == 0 ? IntPtr : "ptr*"
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : IntPtr
        pcPropertySetsMarshal := pcPropertySets == 0 ? IntPtr : "uint*"
        prgPropertySetsMarshal := prgPropertySets is VarRef ? "ptr*" : IntPtr
        prgPropertySetsMarshal := prgPropertySets == 0 ? IntPtr : "ptr*"
        pcConstraintDescsMarshal := pcConstraintDescs is VarRef ? "uint*" : IntPtr
        pcConstraintDescsMarshal := pcConstraintDescs == 0 ? IntPtr : "uint*"
        prgConstraintDescsMarshal := prgConstraintDescs is VarRef ? "ptr*" : IntPtr
        prgConstraintDescsMarshal := prgConstraintDescs == 0 ? IntPtr : "ptr*"
        ppwszStringBufferMarshal := ppwszStringBuffer is VarRef ? "ptr*" : IntPtr
        ppwszStringBufferMarshal := ppwszStringBuffer == 0 ? IntPtr : "ptr*"

        result := ComCall(7, this, DBID.Ptr, pTableID, pcColumnDescsMarshal, pcColumnDescs, prgColumnDescsMarshal, prgColumnDescs, pcPropertySetsMarshal, pcPropertySets, prgPropertySetsMarshal, prgPropertySets, pcConstraintDescsMarshal, pcConstraintDescs, prgConstraintDescsMarshal, prgConstraintDescs, ppwszStringBufferMarshal, ppwszStringBuffer, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ITableCreation.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTableDefinition := CallbackCreate(ObjBindMethod(implObj, "GetTableDefinition"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTableDefinition)
    }
}
