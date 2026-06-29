#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRowChange.ahk" { IRowChange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBCOLUMNINFO.ahk" { DBCOLUMNINFO }
#Import ".\DBCOLUMNACCESS.ahk" { DBCOLUMNACCESS }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowSchemaChange extends IRowChange {
    /**
     * The interface identifier for IRowSchemaChange
     * @type {Guid}
     */
    static IID := Guid("{0c733aae-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowSchemaChange interfaces
    */
    struct Vtbl extends IRowChange.Vtbl {
        DeleteColumns : IntPtr
        AddColumns    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowSchemaChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBID>} rgColumnIDs 
     * @param {Pointer<Integer>} rgdwStatus 
     * @returns {HRESULT} 
     */
    DeleteColumns(cColumns, rgColumnIDs, rgdwStatus) {
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", cColumns, DBID.Ptr, rgColumnIDs, rgdwStatusMarshal, rgdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBCOLUMNINFO>} rgNewColumnInfo 
     * @param {Pointer<DBCOLUMNACCESS>} rgColumns 
     * @returns {HRESULT} 
     */
    AddColumns(cColumns, rgNewColumnInfo, rgColumns) {
        result := ComCall(5, this, "ptr", cColumns, DBCOLUMNINFO.Ptr, rgNewColumnInfo, DBCOLUMNACCESS.Ptr, rgColumns, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowSchemaChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteColumns := CallbackCreate(GetMethod(implObj, "DeleteColumns"), flags, 4)
        this.vtbl.AddColumns := CallbackCreate(GetMethod(implObj, "AddColumns"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteColumns)
        CallbackFree(this.vtbl.AddColumns)
    }
}
