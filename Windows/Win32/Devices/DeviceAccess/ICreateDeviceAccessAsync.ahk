#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ICreateDeviceAccessAsync interface is returned from a call to CreateDeviceAccessInstance.
 * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nn-deviceaccess-icreatedeviceaccessasync
 * @namespace Windows.Win32.Devices.DeviceAccess
 */
export default struct ICreateDeviceAccessAsync extends IUnknown {
    /**
     * The interface identifier for ICreateDeviceAccessAsync
     * @type {Guid}
     */
    static IID := Guid("{3474628f-683d-42d2-abcb-db018c6503bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICreateDeviceAccessAsync interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Cancel    : IntPtr
        Wait      : IntPtr
        Close     : IntPtr
        GetResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICreateDeviceAccessAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Cancel method attempts to cancel an asynchronous operation that is in progress.
     * @remarks
     * If the operation is successfully canceled, a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-getresult">GetResult</a> method occurs.
     * 
     * Your application can call  <b>Cancel</b> at any time. If the operation is already closed or completed, it has no effect.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The Wait method waits a specified length of time for an asynchronous bind operation that is in progress to finish.
     * @param {Integer} timeout Timeout value, in milliseconds, for the wait call. Use <b>INFINITE</b> if you want the caller to wait until the operation finishes.
     * @returns {HRESULT} This method supports standard return values, in addition to these:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait was successful and the operation finished.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The wait timed out before the operation finished.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ILLEGAL_METHOD_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation has already closed when this method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-wait
     */
    Wait(timeout) {
        result := ComCall(4, this, "uint", timeout, "HRESULT")
        return result
    }

    /**
     * The Close method performs cleanup after the asynchronous operation is completed and you retrieve the results.
     * @remarks
     * If the binding is successful, it doesn't invalidate the interface that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-getresult">GetResult</a> method returns.
     * 
     * It isn't strictly necessary to call this method, because resources are cleaned up when the underlying object is deleted. But doing so allows the system to free up resources that are associated with the asynchronous binding. As such, it's good practice to call <b>Close</b> after you retrieve the results.
     * @returns {HRESULT} This method supports standard return values, in addition to these:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property value was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ILLEGAL_METHOD_CALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation did not finish.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-close
     */
    Close() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an IDeviceIoControl object that's bound to the device interface that's specified in a call to the CreateDeviceAccessInstance function.
     * @param {Pointer<Guid>} riid An interface identifier that indicates what type of device access interface the caller wants to retrieve. The only valid value for this identifier is IID_IDeviceIoControl.
     * @returns {Pointer<Void>} If the binding was successful, contains an interface of the type that was supplied to the initial call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-createdeviceaccessinstance">CreateDeviceAccessInstance</a>.
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-getresult
     */
    GetResult(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &deviceAccess := 0, "HRESULT")
        return deviceAccess
    }

    Query(iid) {
        if (ICreateDeviceAccessAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Wait := CallbackCreate(GetMethod(implObj, "Wait"), flags, 2)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.GetResult := CallbackCreate(GetMethod(implObj, "GetResult"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Wait)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.GetResult)
    }
}
