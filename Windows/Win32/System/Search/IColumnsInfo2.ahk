#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IColumnsInfo.ahk" { IColumnsInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DBCOLUMNINFO.ahk" { DBCOLUMNINFO }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IColumnsInfo2 extends IColumnsInfo {
    /**
     * The interface identifier for IColumnsInfo2
     * @type {Guid}
     */
    static IID := Guid("{0c733ab8-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IColumnsInfo2 interfaces
    */
    struct Vtbl extends IColumnsInfo.Vtbl {
        GetRestrictedColumnInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IColumnsInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cColumnIDMasks 
     * @param {Pointer<DBID>} rgColumnIDMasks 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer>} pcColumns 
     * @param {Pointer<Pointer<DBID>>} prgColumnIDs 
     * @param {Pointer<Pointer<DBCOLUMNINFO>>} prgColumnInfo 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    GetRestrictedColumnInfo(cColumnIDMasks, rgColumnIDMasks, dwFlags, pcColumns, prgColumnIDs, prgColumnInfo, ppStringsBuffer) {
        pcColumnsMarshal := pcColumns is VarRef ? "ptr*" : "ptr"
        prgColumnIDsMarshal := prgColumnIDs is VarRef ? "ptr*" : "ptr"
        prgColumnInfoMarshal := prgColumnInfo is VarRef ? "ptr*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cColumnIDMasks, DBID.Ptr, rgColumnIDMasks, "uint", dwFlags, pcColumnsMarshal, pcColumns, prgColumnIDsMarshal, prgColumnIDs, prgColumnInfoMarshal, prgColumnInfo, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IColumnsInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRestrictedColumnInfo := CallbackCreate(GetMethod(implObj, "GetRestrictedColumnInfo"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRestrictedColumnInfo)
    }
}
