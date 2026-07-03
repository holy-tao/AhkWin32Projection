#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetKeys extends IUnknown {
    /**
     * The interface identifier for IRowsetKeys
     * @type {Guid}
     */
    static IID := Guid("{0c733a12-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetKeys interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ListKeys : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetKeys.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pcColumns 
     * @param {Pointer<Pointer<Pointer>>} prgColumns 
     * @returns {HRESULT} 
     */
    ListKeys(pcColumns, prgColumns) {
        pcColumnsMarshal := pcColumns is VarRef ? "ptr*" : "ptr"
        prgColumnsMarshal := prgColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcColumnsMarshal, pcColumns, prgColumnsMarshal, prgColumns, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetKeys.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ListKeys := CallbackCreate(GetMethod(implObj, "ListKeys"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ListKeys)
    }
}
