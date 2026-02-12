#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICreateDeviceAccessAsync interface is returned from a call to CreateDeviceAccessInstance.
 * @see https://learn.microsoft.com/windows/win32/api//content/deviceaccess/nn-deviceaccess-icreatedeviceaccessasync
 * @namespace Windows.Win32.Devices.DeviceAccess
 * @version v4.0.30319
 */
class ICreateDeviceAccessAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateDeviceAccessAsync
     * @type {Guid}
     */
    static IID => Guid("{3474628f-683d-42d2-abcb-db018c6503bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Wait", "Close", "GetResult"]

    /**
     * The Cancel method attempts to cancel an asynchronous operation that is in progress.
     * @remarks
     * If the operation is successfully canceled, a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-getresult">GetResult</a> method occurs.
     * 
     * Your application can call  <b>Cancel</b> at any time. If the operation is already closed or completed, it has no effect.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-wait
     */
    Wait(timeout) {
        result := ComCall(4, this, "uint", timeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-close
     */
    Close() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an IDeviceIoControl object that's bound to the device interface that's specified in a call to the CreateDeviceAccessInstance function.
     * @param {Pointer<Guid>} riid An interface identifier that indicates what type of device access interface the caller wants to retrieve. The only valid value for this identifier is IID_IDeviceIoControl.
     * @returns {Pointer<Pointer<Void>>} If the binding was successful, contains an interface of the type that was supplied to the initial call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-createdeviceaccessinstance">CreateDeviceAccessInstance</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/deviceaccess/nf-deviceaccess-icreatedeviceaccessasync-getresult
     */
    GetResult(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &deviceAccess := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceAccess
    }
}
