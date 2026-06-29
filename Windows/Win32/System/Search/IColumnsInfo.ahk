#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBCOLUMNINFO.ahk" { DBCOLUMNINFO }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IColumnsInfo extends IUnknown {
    /**
     * The interface identifier for IColumnsInfo
     * @type {Guid}
     */
    static IID := Guid("{0c733a11-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IColumnsInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetColumnInfo : IntPtr
        MapColumnIDs  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IColumnsInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcColumns 
     * @param {Pointer<Pointer<DBCOLUMNINFO>>} prgInfo 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    GetColumnInfo(pcColumns, prgInfo, ppStringsBuffer) {
        pcColumnsMarshal := pcColumns is VarRef ? "ptr*" : "ptr"
        prgInfoMarshal := prgInfo is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcColumnsMarshal, pcColumns, prgInfoMarshal, prgInfo, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cColumnIDs 
     * @param {Pointer<DBID>} rgColumnIDs 
     * @returns {Pointer} 
     */
    MapColumnIDs(cColumnIDs, rgColumnIDs) {
        result := ComCall(4, this, "ptr", cColumnIDs, DBID.Ptr, rgColumnIDs, "ptr*", &rgColumns := 0, "HRESULT")
        return rgColumns
    }

    Query(iid) {
        if (IColumnsInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColumnInfo := CallbackCreate(GetMethod(implObj, "GetColumnInfo"), flags, 4)
        this.vtbl.MapColumnIDs := CallbackCreate(GetMethod(implObj, "MapColumnIDs"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColumnInfo)
        CallbackFree(this.vtbl.MapColumnIDs)
    }
}
