#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DeviceInformationCollection.ahk
#Include .\DeviceWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationStatics
     * @type {Guid}
     */
    static IID => Guid("{c17f100e-3a46-4a78-8013-769dc9b97390}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromIdAsync", "CreateFromIdAsyncAdditionalProperties", "FindAllAsync", "FindAllAsyncDeviceClass", "FindAllAsyncAqsFilter", "FindAllAsyncAqsFilterAndAdditionalProperties", "CreateWatcher", "CreateWatcherDeviceClass", "CreateWatcherAqsFilter", "CreateWatcherAqsFilterAndAdditionalProperties"]

    /**
     * 
     * @param {HSTRING} deviceId 
     * @returns {IAsyncOperation<DeviceInformation>} 
     */
    CreateFromIdAsync(deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(6, this, "ptr", deviceId, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformation, asyncOp)
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @returns {IAsyncOperation<DeviceInformation>} 
     */
    CreateFromIdAsyncAdditionalProperties(deviceId, additionalProperties) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr", additionalProperties, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformation, asyncOp)
    }

    /**
     * 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     */
    FindAllAsync() {
        result := ComCall(8, this, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformationCollection, asyncOp)
    }

    /**
     * 
     * @param {Integer} deviceClass_ 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     */
    FindAllAsyncDeviceClass(deviceClass_) {
        result := ComCall(9, this, "int", deviceClass_, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformationCollection, asyncOp)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     */
    FindAllAsyncAqsFilter(aqsFilter) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(10, this, "ptr", aqsFilter, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformationCollection, asyncOp)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     */
    FindAllAsyncAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(11, this, "ptr", aqsFilter, "ptr", additionalProperties, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformationCollection, asyncOp)
    }

    /**
     * 
     * @returns {DeviceWatcher} 
     */
    CreateWatcher() {
        result := ComCall(12, this, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceWatcher(watcher)
    }

    /**
     * 
     * @param {Integer} deviceClass_ 
     * @returns {DeviceWatcher} 
     */
    CreateWatcherDeviceClass(deviceClass_) {
        result := ComCall(13, this, "int", deviceClass_, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceWatcher(watcher)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @returns {DeviceWatcher} 
     */
    CreateWatcherAqsFilter(aqsFilter) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(14, this, "ptr", aqsFilter, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceWatcher(watcher)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @returns {DeviceWatcher} 
     */
    CreateWatcherAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(15, this, "ptr", aqsFilter, "ptr", additionalProperties, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceWatcher(watcher)
    }
}
