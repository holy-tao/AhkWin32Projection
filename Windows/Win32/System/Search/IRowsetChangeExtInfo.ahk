#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetChangeExtInfo extends IUnknown {
    /**
     * The interface identifier for IRowsetChangeExtInfo
     * @type {Guid}
     */
    static IID := Guid("{0c733a8f-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetChangeExtInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOriginalRow    : IntPtr
        GetPendingColumns : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetChangeExtInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} hRow 
     * @param {Pointer<Pointer>} phRowOriginal 
     * @returns {HRESULT} 
     */
    GetOriginalRow(hReserved, hRow, phRowOriginal) {
        phRowOriginalMarshal := phRowOriginal is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hReserved, "ptr", hRow, phRowOriginalMarshal, phRowOriginal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hReserved 
     * @param {Pointer} hRow 
     * @param {Integer} cColumnOrdinals 
     * @param {Pointer<Integer>} rgiOrdinals 
     * @param {Pointer<Integer>} rgColumnStatus 
     * @returns {HRESULT} 
     */
    GetPendingColumns(hReserved, hRow, cColumnOrdinals, rgiOrdinals, rgColumnStatus) {
        rgiOrdinalsMarshal := rgiOrdinals is VarRef ? "uint*" : "ptr"
        rgColumnStatusMarshal := rgColumnStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", hReserved, "ptr", hRow, "uint", cColumnOrdinals, rgiOrdinalsMarshal, rgiOrdinals, rgColumnStatusMarshal, rgColumnStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetChangeExtInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOriginalRow := CallbackCreate(GetMethod(implObj, "GetOriginalRow"), flags, 4)
        this.vtbl.GetPendingColumns := CallbackCreate(GetMethod(implObj, "GetPendingColumns"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOriginalRow)
        CallbackFree(this.vtbl.GetPendingColumns)
    }
}
