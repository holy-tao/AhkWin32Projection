#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IBackgroundCopyJob.ahk" { IBackgroundCopyJob }
#Import ".\IBackgroundCopyError.ahk" { IBackgroundCopyError }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct AsyncIBackgroundCopyCallback extends IUnknown {
    /**
     * The interface identifier for AsyncIBackgroundCopyCallback
     * @type {Guid}
     */
    static IID := Guid("{ca29d251-b4bb-4679-a3d9-ae8006119d54}")

    /**
     * The class identifier for AsyncIBackgroundCopyCallback
     * @type {Guid}
     */
    static CLSID := Guid("{ca29d251-b4bb-4679-a3d9-ae8006119d54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIBackgroundCopyCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_JobTransferred   : IntPtr
        Finish_JobTransferred  : IntPtr
        Begin_JobError         : IntPtr
        Finish_JobError        : IntPtr
        Begin_JobModification  : IntPtr
        Finish_JobModification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIBackgroundCopyCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @returns {HRESULT} 
     */
    Begin_JobTransferred(pJob) {
        result := ComCall(3, this, "ptr", pJob, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_JobTransferred() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {IBackgroundCopyError} pError 
     * @returns {HRESULT} 
     */
    Begin_JobError(pJob, pError) {
        result := ComCall(5, this, "ptr", pJob, "ptr", pError, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_JobError() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBackgroundCopyJob} pJob 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    Begin_JobModification(pJob, dwReserved) {
        result := ComCall(7, this, "ptr", pJob, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_JobModification() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (AsyncIBackgroundCopyCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_JobTransferred := CallbackCreate(GetMethod(implObj, "Begin_JobTransferred"), flags, 2)
        this.vtbl.Finish_JobTransferred := CallbackCreate(GetMethod(implObj, "Finish_JobTransferred"), flags, 1)
        this.vtbl.Begin_JobError := CallbackCreate(GetMethod(implObj, "Begin_JobError"), flags, 3)
        this.vtbl.Finish_JobError := CallbackCreate(GetMethod(implObj, "Finish_JobError"), flags, 1)
        this.vtbl.Begin_JobModification := CallbackCreate(GetMethod(implObj, "Begin_JobModification"), flags, 3)
        this.vtbl.Finish_JobModification := CallbackCreate(GetMethod(implObj, "Finish_JobModification"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_JobTransferred)
        CallbackFree(this.vtbl.Finish_JobTransferred)
        CallbackFree(this.vtbl.Begin_JobError)
        CallbackFree(this.vtbl.Finish_JobError)
        CallbackFree(this.vtbl.Begin_JobModification)
        CallbackFree(this.vtbl.Finish_JobModification)
    }
}
