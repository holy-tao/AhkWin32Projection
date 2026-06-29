#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITableRename extends IUnknown {
    /**
     * The interface identifier for ITableRename
     * @type {Guid}
     */
    static IID := Guid("{0c733a77-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITableRename interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RenameColumn : IntPtr
        RenameTable  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITableRename.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DBID>} pTableId 
     * @param {Pointer<DBID>} pOldColumnId 
     * @param {Pointer<DBID>} pNewColumnId 
     * @returns {HRESULT} 
     */
    RenameColumn(pTableId, pOldColumnId, pNewColumnId) {
        result := ComCall(3, this, DBID.Ptr, pTableId, DBID.Ptr, pOldColumnId, DBID.Ptr, pNewColumnId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pOldTableId 
     * @param {Pointer<DBID>} pOldIndexId 
     * @param {Pointer<DBID>} pNewTableId 
     * @param {Pointer<DBID>} pNewIndexId 
     * @returns {HRESULT} 
     */
    RenameTable(pOldTableId, pOldIndexId, pNewTableId, pNewIndexId) {
        result := ComCall(4, this, DBID.Ptr, pOldTableId, DBID.Ptr, pOldIndexId, DBID.Ptr, pNewTableId, DBID.Ptr, pNewIndexId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITableRename.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RenameColumn := CallbackCreate(GetMethod(implObj, "RenameColumn"), flags, 4)
        this.vtbl.RenameTable := CallbackCreate(GetMethod(implObj, "RenameTable"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RenameColumn)
        CallbackFree(this.vtbl.RenameTable)
    }
}
