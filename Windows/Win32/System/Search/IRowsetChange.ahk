#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetChange extends IUnknown {
    /**
     * The interface identifier for IRowsetChange
     * @type {Guid}
     */
    static IID := Guid("{0c733a05-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeleteRows : IntPtr
        SetData    : IntPtr
        InsertRow  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @returns {Integer} 
     */
    DeleteRows(hReserved, cRows, rghRows) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hReserved, "ptr", cRows, rghRowsMarshal, rghRows, "uint*", &rgRowStatus := 0, "HRESULT")
        return rgRowStatus
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    SetData(hRow, _hAccessor, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", hRow, HACCESSOR, _hAccessor, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {Pointer} 
     */
    InsertRow(hReserved, _hAccessor, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", hReserved, HACCESSOR, _hAccessor, pDataMarshal, pData, "ptr*", &phRow := 0, "HRESULT")
        return phRow
    }

    Query(iid) {
        if (IRowsetChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeleteRows := CallbackCreate(GetMethod(implObj, "DeleteRows"), flags, 5)
        this.vtbl.SetData := CallbackCreate(GetMethod(implObj, "SetData"), flags, 4)
        this.vtbl.InsertRow := CallbackCreate(GetMethod(implObj, "InsertRow"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeleteRows)
        CallbackFree(this.vtbl.SetData)
        CallbackFree(this.vtbl.InsertRow)
    }
}
