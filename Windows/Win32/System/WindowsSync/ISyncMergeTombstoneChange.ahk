#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncMergeTombstoneChange extends IUnknown {
    /**
     * The interface identifier for ISyncMergeTombstoneChange
     * @type {Guid}
     */
    static IID := Guid("{6ec62597-0903-484c-ad61-36d6e938f47b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncMergeTombstoneChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWinnerItemId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncMergeTombstoneChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pbWinnerItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetWinnerItemId(pbWinnerItemId, pcbIdSize) {
        pbWinnerItemIdMarshal := pbWinnerItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbWinnerItemIdMarshal, pbWinnerItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncMergeTombstoneChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWinnerItemId := CallbackCreate(GetMethod(implObj, "GetWinnerItemId"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWinnerItemId)
    }
}
