#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Enumeration\DeviceAccessInformation.ahk
#Include .\GattSession.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\GattCharacteristicsResult.ahk
#Include .\GattDeviceServicesResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattDeviceService3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattDeviceService3
     * @type {Guid}
     */
    static IID => Guid("{b293a950-0c53-437c-a9b3-5c3210c6e569}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceAccessInformation", "get_Session", "get_SharingMode", "RequestAccessAsync", "OpenAsync", "GetCharacteristicsAsync", "GetCharacteristicsWithCacheModeAsync", "GetCharacteristicsForUuidAsync", "GetCharacteristicsForUuidWithCacheModeAsync", "GetIncludedServicesAsync", "GetIncludedServicesWithCacheModeAsync", "GetIncludedServicesForUuidAsync", "GetIncludedServicesForUuidWithCacheModeAsync"]

    /**
     * @type {DeviceAccessInformation} 
     */
    DeviceAccessInformation {
        get => this.get_DeviceAccessInformation()
    }

    /**
     * @type {GattSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
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
     * @returns {GattSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattSession(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {Integer} sharingMode 
     * @returns {IAsyncOperation<Integer>} 
     */
    OpenAsync(sharingMode) {
        result := ComCall(10, this, "int", sharingMode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     */
    GetCharacteristicsAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattCharacteristicsResult, operation)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     */
    GetCharacteristicsWithCacheModeAsync(cacheMode_) {
        result := ComCall(12, this, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattCharacteristicsResult, operation)
    }

    /**
     * 
     * @param {Guid} characteristicUuid 
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     */
    GetCharacteristicsForUuidAsync(characteristicUuid) {
        result := ComCall(13, this, "ptr", characteristicUuid, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattCharacteristicsResult, operation)
    }

    /**
     * 
     * @param {Guid} characteristicUuid 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     */
    GetCharacteristicsForUuidWithCacheModeAsync(characteristicUuid, cacheMode_) {
        result := ComCall(14, this, "ptr", characteristicUuid, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattCharacteristicsResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     */
    GetIncludedServicesAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
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
    GetIncludedServicesWithCacheModeAsync(cacheMode_) {
        result := ComCall(16, this, "int", cacheMode_, "ptr*", &operation := 0, "int")
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
    GetIncludedServicesForUuidAsync(serviceUuid) {
        result := ComCall(17, this, "ptr", serviceUuid, "ptr*", &operation := 0, "int")
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
    GetIncludedServicesForUuidWithCacheModeAsync(serviceUuid, cacheMode_) {
        result := ComCall(18, this, "ptr", serviceUuid, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDeviceServicesResult, operation)
    }
}
