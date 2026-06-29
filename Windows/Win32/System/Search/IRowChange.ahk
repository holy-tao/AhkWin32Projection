#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DBCOLUMNACCESS.ahk" { DBCOLUMNACCESS }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowChange extends IUnknown {
    /**
     * The interface identifier for IRowChange
     * @type {Guid}
     */
    static IID := Guid("{0c733ab5-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetColumns : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBCOLUMNACCESS>} rgColumns 
     * @returns {HRESULT} 
     */
    SetColumns(cColumns, rgColumns) {
        result := ComCall(3, this, "ptr", cColumns, DBCOLUMNACCESS.Ptr, rgColumns, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetColumns := CallbackCreate(GetMethod(implObj, "SetColumns"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetColumns)
    }
}
