#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to report progress back to callers of lengthy Offline Files operations. (IOfflineFilesProgress)
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/nn-cscobj-iofflinefilesprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct IOfflineFilesProgress extends IUnknown {
    /**
     * The interface identifier for IOfflineFilesProgress
     * @type {Guid}
     */
    static IID := Guid("{fad63237-c55b-4911-9850-bcf96d4c979e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOfflineFilesProgress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin      : IntPtr
        QueryAbort : IntPtr
        End        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOfflineFilesProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reports that an operation has begun.
     * @returns {BOOL} Set this value to <b>TRUE</b> to cancel the operation.   Set to <b>FALSE</b> to continue.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesprogress-begin
     */
    Begin() {
        result := ComCall(3, this, BOOL.Ptr, &pbAbort := 0, "HRESULT")
        return pbAbort
    }

    /**
     * May be called during lengthy operations to determine if the operation should be canceled.
     * @remarks
     * This method may be used by the implementation in cases where calls to other progress methods are infrequent.  The sole purpose of this method is to determine if the operation should be canceled immediately.
     * @returns {BOOL} Set this value to <b>TRUE</b> to cancel the operation.   Set to <b>FALSE</b> to continue.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesprogress-queryabort
     */
    QueryAbort() {
        result := ComCall(4, this, BOOL.Ptr, &pbAbort := 0, "HRESULT")
        return pbAbort
    }

    /**
     * Reports that an operation has ended.
     * @param {HRESULT} hrResult Indicates the result of the operation as a whole.  Contains S_OK if the operation completed successfully,  HRESULT_FROM_WIN32(ERROR_CANCELLED) if the operation was canceled or an error value otherwise.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilesprogress-end
     */
    End(hrResult) {
        result := ComCall(5, this, "int", hrResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOfflineFilesProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin := CallbackCreate(GetMethod(implObj, "Begin"), flags, 2)
        this.vtbl.QueryAbort := CallbackCreate(GetMethod(implObj, "QueryAbort"), flags, 2)
        this.vtbl.End := CallbackCreate(GetMethod(implObj, "End"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin)
        CallbackFree(this.vtbl.QueryAbort)
        CallbackFree(this.vtbl.End)
    }
}
