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
     * 
     * @param {Integer} ioControlCode 
     * @param {Pointer<Integer>} inputBuffer 
     * @param {Integer} inputBufferSize 
     * @param {Pointer<Integer>} outputBuffer 
     * @param {Integer} outputBufferSize 
     * @param {Pointer<Integer>} bytesReturned 
     * @returns {HRESULT} 
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
     * 
     * @param {Integer} ioControlCode 
     * @param {Pointer<Integer>} inputBuffer 
     * @param {Integer} inputBufferSize 
     * @param {Pointer<Integer>} outputBuffer 
     * @param {Integer} outputBufferSize 
     * @param {IDeviceRequestCompletionCallback} requestCompletionCallback 
     * @param {Pointer<Pointer>} cancelContext 
     * @returns {HRESULT} 
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
     * 
     * @param {Pointer} cancelContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-ideviceiocontrol-canceloperation
     */
    CancelOperation(cancelContext) {
        result := ComCall(5, this, "ptr", cancelContext, "HRESULT")
        return result
    }
}
