#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOfflineFilesEvents3.ahk" { IOfflineFilesEvents3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesEvents4 extends IOfflineFilesEvents3 {
    /**
     * The interface identifier for IOfflineFilesEvents4
     * @type {Guid}
     */
    static IID := Guid("{dbd69b1e-c7d2-473e-b35f-9d8c24c0c484}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesEvents4 interfaces
    */
    struct Vtbl extends IOfflineFilesEvents3.Vtbl {
        PrefetchCloseHandleBegin : IntPtr
        PrefetchCloseHandleEnd   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesEvents4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PrefetchCloseHandleBegin() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwClosedHandleCount 
     * @param {Integer} dwOpenHandleCount 
     * @param {HRESULT} hrResult 
     * @returns {HRESULT} 
     */
    PrefetchCloseHandleEnd(dwClosedHandleCount, dwOpenHandleCount, hrResult) {
        result := ComCall(41, this, "uint", dwClosedHandleCount, "uint", dwOpenHandleCount, "int", hrResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesEvents4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PrefetchCloseHandleBegin := CallbackCreate(GetMethod(implObj, "PrefetchCloseHandleBegin"), flags, 1)
        this.vtbl.PrefetchCloseHandleEnd := CallbackCreate(GetMethod(implObj, "PrefetchCloseHandleEnd"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PrefetchCloseHandleBegin)
        CallbackFree(this.vtbl.PrefetchCloseHandleEnd)
    }
}
