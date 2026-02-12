#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BluetoothLEDevice.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{c8cf1a19-f0b6-4bf0-8689-41303de2d9f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync", "FromBluetoothAddressAsync", "GetDeviceSelector"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<BluetoothLEDevice>} 
     */
    FromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BluetoothLEDevice, operation)
    }

    /**
     * 
     * @param {Integer} bluetoothAddress 
     * @returns {IAsyncOperation<BluetoothLEDevice>} 
     */
    FromBluetoothAddressAsync(bluetoothAddress) {
        result := ComCall(7, this, "uint", bluetoothAddress, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BluetoothLEDevice, operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
