#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Enumeration\DeviceAccessInformation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include GenericAttributeProfile\GattDeviceServicesResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEDevice3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEDevice3
     * @type {Guid}
     */
    static IID => Guid("{aee9e493-44ac-40dc-af33-b2c13c01ca46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceAccessInformation", "RequestAccessAsync", "GetGattServicesAsync", "GetGattServicesWithCacheModeAsync", "GetGattServicesForUuidAsync", "GetGattServicesForUuidWithCacheModeAsync"]

    /**
     * @type {DeviceAccessInformation} 
     */
    DeviceAccessInformation {
        get => this.get_DeviceAccessInformation()
    }

    /**
     * 
     * @returns {DeviceAccessInformation} 
     */
    get_DeviceAccessInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceAccessInformation(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     */
    GetGattServicesAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceServicesResult, operation)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     */
    GetGattServicesWithCacheModeAsync(cacheMode_) {
        result := ComCall(9, this, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceServicesResult, operation)
    }

    /**
     * 
     * @param {Guid} serviceUuid 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     */
    GetGattServicesForUuidAsync(serviceUuid) {
        result := ComCall(10, this, "ptr", serviceUuid, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceServicesResult, operation)
    }

    /**
     * 
     * @param {Guid} serviceUuid 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     */
    GetGattServicesForUuidWithCacheModeAsync(serviceUuid, cacheMode_) {
        result := ComCall(11, this, "ptr", serviceUuid, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceServicesResult, operation)
    }
}
