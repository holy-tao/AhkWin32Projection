#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateDownloadResult.ahk" { IUpdateDownloadResult }
#Import ".\OperationResultCode.ahk" { OperationResultCode }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents the result of a download operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-idownloadresult
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IDownloadResult extends IDispatch {
    /**
     * The interface identifier for IDownloadResult
     * @type {Guid}
     */
    static IID := Guid("{daa4fdd0-4727-4dbe-a1e7-745dca317144}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_HResult     : IntPtr
        get_ResultCode  : IntPtr
        GetUpdateResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    HResult {
        get => this.get_HResult()
    }

    /**
     * @type {OperationResultCode} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * Gets the exception code number if an exception code number is raised during the download.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadresult-get_hresult
     */
    get_HResult() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an OperationResultCodeenumeration that specifies the result of the download.
     * @returns {OperationResultCode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Returns an IUpdateDownloadResult interface that contains the download information for a specified update.
     * @param {Integer} updateIndex The index of the update.
     * @returns {IUpdateDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloadresult">IUpdateDownloadResult</a> interface that contains the results for the specified update.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadresult-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(9, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadResult(retval)
    }

    Query(iid) {
        if (IDownloadResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HResult := CallbackCreate(GetMethod(implObj, "get_HResult"), flags, 2)
        this.vtbl.get_ResultCode := CallbackCreate(GetMethod(implObj, "get_ResultCode"), flags, 2)
        this.vtbl.GetUpdateResult := CallbackCreate(GetMethod(implObj, "GetUpdateResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HResult)
        CallbackFree(this.vtbl.get_ResultCode)
        CallbackFree(this.vtbl.GetUpdateResult)
    }
}
