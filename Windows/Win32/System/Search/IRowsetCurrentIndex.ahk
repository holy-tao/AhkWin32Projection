#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRowsetIndex.ahk" { IRowsetIndex }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IRowsetCurrentIndex extends IRowsetIndex {
    /**
     * The interface identifier for IRowsetCurrentIndex
     * @type {Guid}
     */
    static IID := Guid("{0c733abd-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRowsetCurrentIndex interfaces
    */
    struct Vtbl extends IRowsetIndex.Vtbl {
        GetIndex : IntPtr
        SetIndex : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRowsetCurrentIndex.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<DBID>} 
     */
    GetIndex() {
        result := ComCall(6, this, "ptr*", &ppIndexID := 0, "HRESULT")
        return ppIndexID
    }

    /**
     * 
     * @param {Pointer<DBID>} pIndexID 
     * @returns {HRESULT} 
     */
    SetIndex(pIndexID) {
        result := ComCall(7, this, DBID.Ptr, pIndexID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRowsetCurrentIndex.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIndex := CallbackCreate(GetMethod(implObj, "GetIndex"), flags, 2)
        this.vtbl.SetIndex := CallbackCreate(GetMethod(implObj, "SetIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIndex)
        CallbackFree(this.vtbl.SetIndex)
    }
}
