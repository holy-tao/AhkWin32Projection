#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OperationResultCode.ahk" { OperationResultCode }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateInstallationResult.ahk" { IUpdateInstallationResult }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents the result of an installation or uninstallation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iinstallationresult
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IInstallationResult extends IDispatch {
    /**
     * The interface identifier for IInstallationResult
     * @type {Guid}
     */
    static IID := Guid("{a43c56d6-7451-48d4-af96-b6cd2d0d9b7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInstallationResult interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_HResult        : IntPtr
        get_RebootRequired : IntPtr
        get_ResultCode     : IntPtr
        GetUpdateResult    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInstallationResult.Vtbl()
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
     * @type {VARIANT_BOOL} 
     */
    RebootRequired {
        get => this.get_RebootRequired()
    }

    /**
     * @type {OperationResultCode} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * Gets the HRESULT of the exception, if any, that is raised during the installation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_hresult
     */
    get_HResult() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether you must restart the computer to complete the installation or uninstallation of an update.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an OperationResultCode value that specifies the result of an operation on an update. (IInstallationResult.get_ResultCode)
     * @returns {OperationResultCode} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Returns an IUpdateInstallationResult interface that contains the installation results for a specified update.
     * @param {Integer} updateIndex The index of an update.
     * @returns {IUpdateInstallationResult} An interface that contains results for a specified update.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinstallationresult-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(10, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateInstallationResult(retval)
    }

    Query(iid) {
        if (IInstallationResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HResult := CallbackCreate(GetMethod(implObj, "get_HResult"), flags, 2)
        this.vtbl.get_RebootRequired := CallbackCreate(GetMethod(implObj, "get_RebootRequired"), flags, 2)
        this.vtbl.get_ResultCode := CallbackCreate(GetMethod(implObj, "get_ResultCode"), flags, 2)
        this.vtbl.GetUpdateResult := CallbackCreate(GetMethod(implObj, "GetUpdateResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HResult)
        CallbackFree(this.vtbl.get_RebootRequired)
        CallbackFree(this.vtbl.get_ResultCode)
        CallbackFree(this.vtbl.GetUpdateResult)
    }
}
