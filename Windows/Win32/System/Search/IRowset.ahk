#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowset extends IUnknown {
    /**
     * The interface identifier for IRowset
     * @type {Guid}
     */
    static IID := Guid("{0c733a7c-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowset interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRefRows      : IntPtr
        GetData         : IntPtr
        GetNextRows     : IntPtr
        ReleaseRows     : IntPtr
        RestartPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowset.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRefCounts 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    AddRefRows(cRows, rghRows, rgRefCounts, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRefCountsMarshal := rgRefCounts is VarRef ? "uint*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", cRows, rghRowsMarshal, rghRows, rgRefCountsMarshal, rgRefCounts, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hRow 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Void} 
     */
    GetData(hRow, _hAccessor) {
        result := ComCall(4, this, "ptr", hRow, HACCESSOR, _hAccessor, "ptr", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} lRowsOffset 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} pcRowsObtained 
     * @param {Pointer<Pointer<Pointer>>} prghRows 
     * @returns {HRESULT} 
     */
    GetNextRows(hReserved, lRowsOffset, cRows, pcRowsObtained, prghRows) {
        pcRowsObtainedMarshal := pcRowsObtained is VarRef ? "ptr*" : "ptr"
        prghRowsMarshal := prghRows is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", hReserved, "ptr", lRowsOffset, "ptr", cRows, pcRowsObtainedMarshal, pcRowsObtained, prghRowsMarshal, prghRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<Pointer>} rghRows 
     * @param {Pointer<Integer>} rgRowOptions 
     * @param {Pointer<Integer>} rgRefCounts 
     * @param {Pointer<Integer>} rgRowStatus 
     * @returns {HRESULT} 
     */
    ReleaseRows(cRows, rghRows, rgRowOptions, rgRefCounts, rgRowStatus) {
        rghRowsMarshal := rghRows is VarRef ? "ptr*" : "ptr"
        rgRowOptionsMarshal := rgRowOptions is VarRef ? "uint*" : "ptr"
        rgRefCountsMarshal := rgRefCounts is VarRef ? "uint*" : "ptr"
        rgRowStatusMarshal := rgRowStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, rghRowsMarshal, rghRows, rgRowOptionsMarshal, rgRowOptions, rgRefCountsMarshal, rgRefCounts, rgRowStatusMarshal, rgRowStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @returns {HRESULT} 
     */
    RestartPosition(hReserved) {
        result := ComCall(7, this, "ptr", hReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowset.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRefRows := CallbackCreate(GetMethod(implObj, "AddRefRows"), flags, 5)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 4)
        this.vtbl.GetNextRows := CallbackCreate(GetMethod(implObj, "GetNextRows"), flags, 6)
        this.vtbl.ReleaseRows := CallbackCreate(GetMethod(implObj, "ReleaseRows"), flags, 6)
        this.vtbl.RestartPosition := CallbackCreate(GetMethod(implObj, "RestartPosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRefRows)
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.GetNextRows)
        CallbackFree(this.vtbl.ReleaseRows)
        CallbackFree(this.vtbl.RestartPosition)
    }
}
