#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sends a control code to a device driver.This action causes the device to perform the corresponding operation.
 * @see https://docs.microsoft.com/windows/win32/api//deviceaccess/nn-deviceaccess-ideviceiocontrol
 * @namespace Windows.Win32.Devices.DeviceAccess
 * @version v4.0.30319
 */
class IDeviceIoControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceIoControl
     * @type {Guid}
     */
    static IID => Guid("{9eefe161-23ab-4f18-9b49-991b586ae970}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceIoControlSync", "DeviceIoControlAsync", "CancelOperation"]

    /**
     * The DeviceIoControlSync method sends a synchronous device input/output (I/O) control request to the device interface that the call to the CreateDeviceAccessInstance function specified.
     * @param {Integer} ioControlCode The I/O control code for the operation.
     * @param {Pointer<Integer>} inputBuffer An optional input buffer for the operation.
     * @param {Integer} inputBufferSize The size of input buffer, in bytes.
     * @param {Pointer<Integer>} outputBuffer An optional output buffer for the operation.
     * @param {Integer} outputBufferSize The size of output buffer, in bytes.
     * @param {Pointer<Integer>} bytesReturned A pointer to a variable that receives the number of bytes that were written into the output buffer, if one was specified.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//deviceaccess/nf-deviceaccess-ideviceiocontrol-deviceiocontrolsync
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
     * @param {Integer} ioControlCode The I/O control code for the operation.
     * @param {Pointer<Integer>} inputBuffer An optional input buffer for the operation.
     * @param {Integer} inputBufferSize The size of input buffer, in bytes.
     * @param {Pointer<Integer>} outputBuffer An operational output buffer for the operation.
     * @param {Integer} outputBufferSize The size of output buffer, in bytes.
     * @param {IDeviceRequestCompletionCallback} requestCompletionCallback The callback interface on which the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-idevicerequestcompletioncallback-requestcompletion">RequestCompletion</a> method is called if the operation is submitted successfully.
     * @param {Pointer<Pointer>} cancelContext An optional pointer that receives a cancel context that can be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-canceloperation">CancelOperation</a>method to cancel an outstanding request.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//deviceaccess/nf-deviceaccess-ideviceiocontrol-deviceiocontrolasync
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
     * @see https://docs.microsoft.com/windows/win32/api//deviceaccess/nf-deviceaccess-ideviceiocontrol-canceloperation
     */
    CancelOperation(cancelContext) {
        result := ComCall(5, this, "ptr", cancelContext, "HRESULT")
        return result
    }
}
