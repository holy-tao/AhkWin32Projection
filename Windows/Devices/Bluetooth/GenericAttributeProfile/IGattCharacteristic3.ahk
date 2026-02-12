#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattDescriptorsResult.ahk
#Include .\GattWriteResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristic3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristic3
     * @type {Guid}
     */
    static IID => Guid("{3f3c663e-93d4-406b-b817-db81f8ed53b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescriptorsAsync", "GetDescriptorsWithCacheModeAsync", "GetDescriptorsForUuidAsync", "GetDescriptorsForUuidWithCacheModeAsync", "WriteValueWithResultAsync", "WriteValueWithResultAndOptionAsync", "WriteClientCharacteristicConfigurationDescriptorWithResultAsync"]

    /**
     * 
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     */
    GetDescriptorsAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDescriptorsResult, operation)
    }

    /**
     * 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     */
    GetDescriptorsWithCacheModeAsync(cacheMode_) {
        result := ComCall(7, this, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDescriptorsResult, operation)
    }

    /**
     * 
     * @param {Guid} descriptorUuid 
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     */
    GetDescriptorsForUuidAsync(descriptorUuid) {
        result := ComCall(8, this, "ptr", descriptorUuid, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDescriptorsResult, operation)
    }

    /**
     * 
     * @param {Guid} descriptorUuid 
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDescriptorsResult>} 
     */
    GetDescriptorsForUuidWithCacheModeAsync(descriptorUuid, cacheMode_) {
        result := ComCall(9, this, "ptr", descriptorUuid, "int", cacheMode_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattDescriptorsResult, operation)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {IAsyncOperation<GattWriteResult>} 
     */
    WriteValueWithResultAsync(value) {
        result := ComCall(10, this, "ptr", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattWriteResult, operation)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @param {Integer} writeOption 
     * @returns {IAsyncOperation<GattWriteResult>} 
     */
    WriteValueWithResultAndOptionAsync(value, writeOption) {
        result := ComCall(11, this, "ptr", value, "int", writeOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattWriteResult, operation)
    }

    /**
     * 
     * @param {Integer} clientCharacteristicConfigurationDescriptorValue 
     * @returns {IAsyncOperation<GattWriteResult>} 
     */
    WriteClientCharacteristicConfigurationDescriptorWithResultAsync(clientCharacteristicConfigurationDescriptorValue) {
        result := ComCall(12, this, "int", clientCharacteristicConfigurationDescriptorValue, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattWriteResult, operation)
    }
}
