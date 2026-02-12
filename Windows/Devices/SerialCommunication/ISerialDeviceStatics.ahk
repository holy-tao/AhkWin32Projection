#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SerialDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class ISerialDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISerialDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{058c4a70-0836-4993-ae1a-b61ae3be056b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorFromPortName", "GetDeviceSelectorFromUsbVidPid", "FromIdAsync"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} portName 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromPortName(portName) {
        if(portName is String) {
            pin := HSTRING.Create(portName)
            portName := pin.Value
        }
        portName := portName is Win32Handle ? NumGet(portName, "ptr") : portName

        result_ := HSTRING()
        result := ComCall(7, this, "ptr", portName, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} vendorId 
     * @param {Integer} productId 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromUsbVidPid(vendorId, productId) {
        result_ := HSTRING()
        result := ComCall(8, this, "ushort", vendorId, "ushort", productId, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<SerialDevice>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(9, this, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SerialDevice, result_)
    }
}
