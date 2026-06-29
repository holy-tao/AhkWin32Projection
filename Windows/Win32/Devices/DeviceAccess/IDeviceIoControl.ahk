#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDeviceRequestCompletionCallback.ahk" { IDeviceRequestCompletionCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sends a control code to a device driver.This action causes the device to perform the corresponding operation.
 * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nn-deviceaccess-ideviceiocontrol
 * @namespace Windows.Win32.Devices.DeviceAccess
 */
export default struct IDeviceIoControl extends IUnknown {
    /**
     * The interface identifier for IDeviceIoControl
     * @type {Guid}
     */
    static IID := Guid("{9eefe161-23ab-4f18-9b49-991b586ae970}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeviceIoControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceIoControlSync  : IntPtr
        DeviceIoControlAsync : IntPtr
        CancelOperation      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeviceIoControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DeviceIoControlSync method sends a synchronous device input/output (I/O) control request to the device interface that the call to the CreateDeviceAccessInstance function specified.
     * @remarks
     * Because  this is a synchronous method, you must not use it on a thread that can't handle being blocked for an extended period. In this case, you use the <b>DeviceIoControlAsync</b> method.
     * @param {Integer} ioControlCode The I/O control code for the operation.
     * @param {Pointer<Integer>} inputBuffer An optional input buffer for the operation.
     * @param {Integer} inputBufferSize The size of input buffer, in bytes.
     * @param {Pointer<Integer>} outputBuffer An optional output buffer for the operation.
     * @param {Integer} outputBufferSize The size of output buffer, in bytes.
     * @param {Pointer<Integer>} bytesReturned A pointer to a variable that receives the number of bytes that were written into the output buffer, if one was specified.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-deviceiocontrolsync
     */
    DeviceIoControlSync(ioControlCode, inputBuffer, inputBufferSize, outputBuffer, outputBufferSize, bytesReturned) {
        inputBufferMarshal := inputBuffer is VarRef ? "char*" : "ptr"
        outputBufferMarshal := outputBuffer is VarRef ? "char*" : "ptr"
        bytesReturnedMarshal := bytesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", ioControlCode, inputBufferMarshal, inputBuffer, "uint", inputBufferSize, outputBufferMarshal, outputBuffer, "uint", outputBufferSize, bytesReturnedMarshal, bytesReturned, "HRESULT")
        return result
    }

    /**
     * The DeviceIoControlAsync method sends an asynchronous device input/output (I/O) control request to the device interface that the call to the CreateDeviceAccessInstance function specified.
     * @remarks
     * If the request is submitted successfully (that is, calling this function doesn't immediately return an error), the result of the operation is available in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-idevicerequestcompletioncallback-requestcompletion">RequestCompletion</a> callback of the supplied <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nn-deviceaccess-idevicerequestcompletioncallback">IDeviceRequestCompletionCallback</a> interface.
     * 
     * An operation that the system (operating system or device driver) fails immediately doesn't result in a callback.This means that the caller  receives a callback only if this function returns <b>S_OK</b>.
     * @param {Integer} ioControlCode The I/O control code for the operation.
     * @param {Pointer<Integer>} inputBuffer An optional input buffer for the operation.
     * @param {Integer} inputBufferSize The size of input buffer, in bytes.
     * @param {Pointer<Integer>} outputBuffer An operational output buffer for the operation.
     * @param {Integer} outputBufferSize The size of output buffer, in bytes.
     * @param {IDeviceRequestCompletionCallback} requestCompletionCallback The callback interface on which the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-idevicerequestcompletioncallback-requestcompletion">RequestCompletion</a> method is called if the operation is submitted successfully.
     * @param {Pointer<Pointer>} cancelContext An optional pointer that receives a cancel context that can be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-canceloperation">CancelOperation</a> method to cancel an outstanding request.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-deviceiocontrolasync
     */
    DeviceIoControlAsync(ioControlCode, inputBuffer, inputBufferSize, outputBuffer, outputBufferSize, requestCompletionCallback, cancelContext) {
        inputBufferMarshal := inputBuffer is VarRef ? "char*" : "ptr"
        outputBufferMarshal := outputBuffer is VarRef ? "char*" : "ptr"
        cancelContextMarshal := cancelContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", ioControlCode, inputBufferMarshal, inputBuffer, "uint", inputBufferSize, outputBufferMarshal, outputBuffer, "uint", outputBufferSize, "ptr", requestCompletionCallback, cancelContextMarshal, cancelContext, "HRESULT")
        return result
    }

    /**
     * The CancelOperation method attempts to cancel a previously issued call by using the DeviceIoControlAsync method.
     * @remarks
     * Regardless of whether cancellation is successful, the result of the operation is available in the callback that's provided to the asynchronous call.
     * @param {Pointer} cancelContext The cancel context that a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-deviceiocontrolasync">DeviceIoControlAsync</a> returned.
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
     * The operation was still outstanding, and cancellation was attempted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was no longer outstanding.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-canceloperation
     */
    CancelOperation(cancelContext) {
        result := ComCall(5, this, "ptr", cancelContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDeviceIoControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceIoControlSync := CallbackCreate(GetMethod(implObj, "DeviceIoControlSync"), flags, 7)
        this.vtbl.DeviceIoControlAsync := CallbackCreate(GetMethod(implObj, "DeviceIoControlAsync"), flags, 8)
        this.vtbl.CancelOperation := CallbackCreate(GetMethod(implObj, "CancelOperation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceIoControlSync)
        CallbackFree(this.vtbl.DeviceIoControlAsync)
        CallbackFree(this.vtbl.CancelOperation)
    }
}
