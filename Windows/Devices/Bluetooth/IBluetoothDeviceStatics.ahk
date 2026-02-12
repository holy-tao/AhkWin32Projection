#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BluetoothDevice.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{0991df51-57db-4725-bbd7-84f64327ec2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync", "FromHostNameAsync", "FromBluetoothAddressAsync", "GetDeviceSelector"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<BluetoothDevice>} 
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

        return IAsyncOperation(BluetoothDevice, operation)
    }

    /**
     * 
     * @param {HostName} hostName_ 
     * @returns {IAsyncOperation<BluetoothDevice>} 
     */
    FromHostNameAsync(hostName_) {
        result := ComCall(7, this, "ptr", hostName_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BluetoothDevice, operation)
    }

    /**
     * 
     * @param {Integer} address_ 
     * @returns {IAsyncOperation<BluetoothDevice>} 
     */
    FromBluetoothAddressAsync(address_) {
        result := ComCall(8, this, "uint", address_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BluetoothDevice, operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelector() {
        deviceSelector := HSTRING()
        result := ComCall(9, this, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }
}
