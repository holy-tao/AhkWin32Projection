#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISyncFilter.ahk" { ISyncFilter }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFilterDeserializer extends IUnknown {
    /**
     * The interface identifier for ISyncFilterDeserializer
     * @type {Guid}
     */
    static IID := Guid("{b45b7a72-e5c7-46be-9c82-77b8b15dab8a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFilterDeserializer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeserializeSyncFilter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFilterDeserializer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} pbSyncFilter 
     * @param {Integer} dwCbSyncFilter 
     * @returns {ISyncFilter} 
     */
    DeserializeSyncFilter(pbSyncFilter, dwCbSyncFilter) {
        pbSyncFilterMarshal := pbSyncFilter is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbSyncFilterMarshal, pbSyncFilter, "uint", dwCbSyncFilter, "ptr*", &ppISyncFilter := 0, "HRESULT")
        return ISyncFilter(ppISyncFilter)
    }

    Query(iid) {
        if (ISyncFilterDeserializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeserializeSyncFilter := CallbackCreate(GetMethod(implObj, "DeserializeSyncFilter"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeserializeSyncFilter)
    }
}
