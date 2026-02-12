#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\BluetoothLEDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEDeviceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEDeviceStatics2
     * @type {Guid}
     */
    static IID => Guid("{5f12c06b-3bac-43e8-ad16-563271bd41c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelectorFromPairingState", "GetDeviceSelectorFromConnectionStatus", "GetDeviceSelectorFromDeviceName", "GetDeviceSelectorFromBluetoothAddress", "GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType", "GetDeviceSelectorFromAppearance", "FromBluetoothAddressWithBluetoothAddressTypeAsync"]

    /**
     * 
     * @param {Boolean} pairingState 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromPairingState(pairingState) {
        deviceSelector := HSTRING()
        result := ComCall(6, this, "int", pairingState, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {Integer} connectionStatus 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromConnectionStatus(connectionStatus) {
        deviceSelector := HSTRING()
        result := ComCall(7, this, "int", connectionStatus, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {HSTRING} deviceName 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromDeviceName(deviceName) {
        if(deviceName is String) {
            pin := HSTRING.Create(deviceName)
            deviceName := pin.Value
        }
        deviceName := deviceName is Win32Handle ? NumGet(deviceName, "ptr") : deviceName

        deviceSelector := HSTRING()
        result := ComCall(8, this, "ptr", deviceName, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {Integer} bluetoothAddress 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromBluetoothAddress(bluetoothAddress) {
        deviceSelector := HSTRING()
        result := ComCall(9, this, "uint", bluetoothAddress, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {Integer} bluetoothAddress 
     * @param {Integer} bluetoothAddressType_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType(bluetoothAddress, bluetoothAddressType_) {
        deviceSelector := HSTRING()
        result := ComCall(10, this, "uint", bluetoothAddress, "int", bluetoothAddressType_, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {BluetoothLEAppearance} appearance 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromAppearance(appearance) {
        deviceSelector := HSTRING()
        result := ComCall(11, this, "ptr", appearance, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }

    /**
     * 
     * @param {Integer} bluetoothAddress 
     * @param {Integer} bluetoothAddressType_ 
     * @returns {IAsyncOperation<BluetoothLEDevice>} 
     */
    FromBluetoothAddressWithBluetoothAddressTypeAsync(bluetoothAddress, bluetoothAddressType_) {
        result := ComCall(12, this, "uint", bluetoothAddress, "int", bluetoothAddressType_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BluetoothLEDevice, operation)
    }
}
