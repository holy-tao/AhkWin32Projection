#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBCOLUMNDESC.ahk" { DBCOLUMNDESC }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IAlterTable extends IUnknown {
    /**
     * The interface identifier for IAlterTable
     * @type {Guid}
     */
    static IID := Guid("{0c733aa5-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAlterTable interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AlterColumn : IntPtr
        AlterTable  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAlterTable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pColumnId 
     * @param {Integer} dwColumnDescFlags 
     * @param {Pointer<DBCOLUMNDESC>} pColumnDesc 
     * @returns {HRESULT} 
     */
    AlterColumn(pTableId, pColumnId, dwColumnDescFlags, pColumnDesc) {
        result := ComCall(3, this, DBID.Ptr, pTableId, DBID.Ptr, pColumnId, "uint", dwColumnDescFlags, DBCOLUMNDESC.Ptr, pColumnDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pNewTableId 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    AlterTable(pTableId, pNewTableId, cPropertySets, rgPropertySets) {
        result := ComCall(4, this, DBID.Ptr, pTableId, DBID.Ptr, pNewTableId, "uint", cPropertySets, DBPROPSET.Ptr, rgPropertySets, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAlterTable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AlterColumn := CallbackCreate(GetMethod(implObj, "AlterColumn"), flags, 5)
        this.vtbl.AlterTable := CallbackCreate(GetMethod(implObj, "AlterTable"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AlterColumn)
        CallbackFree(this.vtbl.AlterTable)
    }
}
