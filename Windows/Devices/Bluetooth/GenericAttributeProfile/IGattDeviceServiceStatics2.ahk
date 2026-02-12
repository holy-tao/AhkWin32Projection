#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattDeviceService.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDeviceServiceStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDeviceServiceStatics2
     * @type {Guid}
     */
    static IID => Guid("{0604186e-24a6-4b0d-a2f2-30cc01545d25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdWithSharingModeAsync", "GetDeviceSelectorForBluetoothDeviceId", "GetDeviceSelectorForBluetoothDeviceIdWithCacheMode", "GetDeviceSelectorForBluetoothDeviceIdAndUuid", "GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {Integer} sharingMode 
     * @returns {IAsyncOperation<GattDeviceService>} 
     */
    FromIdWithSharingModeAsync(deviceId, sharingMode) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "int", sharingMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceService, operation)
    }

    /**
     * 
     * @param {BluetoothDeviceId} bluetoothDeviceId_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId_) {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", bluetoothDeviceId_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {BluetoothDeviceId} bluetoothDeviceId_ 
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceIdWithCacheMode(bluetoothDeviceId_, cacheMode_) {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", bluetoothDeviceId_, "int", cacheMode_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {BluetoothDeviceId} bluetoothDeviceId_ 
     * @param {Guid} serviceUuid 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId_, serviceUuid) {
        result_ := HSTRING()
        result := ComCall(9, this, "ptr", bluetoothDeviceId_, "ptr", serviceUuid, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {BluetoothDeviceId} bluetoothDeviceId_ 
     * @param {Guid} serviceUuid 
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode(bluetoothDeviceId_, serviceUuid, cacheMode_) {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", bluetoothDeviceId_, "ptr", serviceUuid, "int", cacheMode_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
