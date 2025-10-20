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
     * 
     * @param {Integer} ioControlCode 
     * @param {Pointer<Byte>} inputBuffer 
     * @param {Integer} inputBufferSize 
     * @param {Pointer<Byte>} outputBuffer 
     * @param {Integer} outputBufferSize 
     * @param {Pointer<UInt32>} bytesReturned 
     * @returns {HRESULT} 
     */
    DeviceIoControlSync(ioControlCode, inputBuffer, inputBufferSize, outputBuffer, outputBufferSize, bytesReturned) {
        result := ComCall(3, this, "uint", ioControlCode, "char*", inputBuffer, "uint", inputBufferSize, "char*", outputBuffer, "uint", outputBufferSize, "uint*", bytesReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ioControlCode 
     * @param {Pointer<Byte>} inputBuffer 
     * @param {Integer} inputBufferSize 
     * @param {Pointer<Byte>} outputBuffer 
     * @param {Integer} outputBufferSize 
     * @param {Pointer<IDeviceRequestCompletionCallback>} requestCompletionCallback 
     * @param {Pointer<UIntPtr>} cancelContext 
     * @returns {HRESULT} 
     */
    DeviceIoControlAsync(ioControlCode, inputBuffer, inputBufferSize, outputBuffer, outputBufferSize, requestCompletionCallback, cancelContext) {
        result := ComCall(4, this, "uint", ioControlCode, "char*", inputBuffer, "uint", inputBufferSize, "char*", outputBuffer, "uint", outputBufferSize, "ptr", requestCompletionCallback, "ptr*", cancelContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cancelContext 
     * @returns {HRESULT} 
     */
    CancelOperation(cancelContext) {
        result := ComCall(5, this, "ptr", cancelContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
