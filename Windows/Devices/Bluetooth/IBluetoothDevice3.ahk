#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Enumeration\DeviceAccessInformation.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include Rfcomm\RfcommDeviceServicesResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothDevice3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothDevice3
     * @type {Guid}
     */
    static IID => Guid("{57fff78b-651a-4454-b90f-eb21ef0b0d71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceAccessInformation", "RequestAccessAsync", "GetRfcommServicesAsync", "GetRfcommServicesWithCacheModeAsync", "GetRfcommServicesForIdAsync", "GetRfcommServicesForIdWithCacheModeAsync"]

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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     */
    GetRfcommServicesAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RfcommDeviceServicesResult, operation)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     */
    GetRfcommServicesWithCacheModeAsync(cacheMode_) {
        result := ComCall(9, this, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RfcommDeviceServicesResult, operation)
    }

    /**
     * 
     * @param {RfcommServiceId} serviceId 
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     */
    GetRfcommServicesForIdAsync(serviceId) {
        result := ComCall(10, this, "ptr", serviceId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RfcommDeviceServicesResult, operation)
    }

    /**
     * 
     * @param {RfcommServiceId} serviceId 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     */
    GetRfcommServicesForIdWithCacheModeAsync(serviceId, cacheMode_) {
        result := ComCall(11, this, "ptr", serviceId, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RfcommDeviceServicesResult, operation)
    }
}
