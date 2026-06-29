#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OperationResultCode.ahk" { OperationResultCode }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains the properties that indicate the status of a download operation for an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatedownloadresult
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateDownloadResult extends IDispatch {
    /**
     * The interface identifier for IUpdateDownloadResult
     * @type {Guid}
     */
    static IID := Guid("{bf99af76-b575-42ad-8aa4-33cbb5477af1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateDownloadResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_HResult    : IntPtr
        get_ResultCode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateDownloadResult.Vtbl()
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
     * Gets the exception HRESULT value, if any, that is raised during the operation on the update.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadresult-get_hresult
     */
    get_HResult() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an OperationResultCode enumeration value that specifies the result of an operation on the update.
     * @returns {OperationResultCode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateDownloadResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HResult := CallbackCreate(GetMethod(implObj, "get_HResult"), flags, 2)
        this.vtbl.get_ResultCode := CallbackCreate(GetMethod(implObj, "get_ResultCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HResult)
        CallbackFree(this.vtbl.get_ResultCode)
    }
}
