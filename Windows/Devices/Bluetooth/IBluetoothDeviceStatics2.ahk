#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothDeviceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothDeviceStatics2
     * @type {Guid}
     */
    static IID => Guid("{c29e8e2f-4e14-4477-aa1b-b8b47e5b7ece}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelectorFromPairingState", "GetDeviceSelectorFromConnectionStatus", "GetDeviceSelectorFromDeviceName", "GetDeviceSelectorFromBluetoothAddress", "GetDeviceSelectorFromClassOfDevice"]

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
     * @param {BluetoothClassOfDevice} classOfDevice 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorFromClassOfDevice(classOfDevice) {
        deviceSelector := HSTRING()
        result := ComCall(10, this, "ptr", classOfDevice, "ptr", deviceSelector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceSelector
    }
}
