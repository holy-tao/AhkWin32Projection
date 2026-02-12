#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DeviceInformation.ahk
#Include .\DeviceInformationCollection.ahk
#Include .\DeviceWatcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationStatics2
     * @type {Guid}
     */
    static IID => Guid("{493b4f34-a84f-45fd-9167-15d1cb1bd1f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAqsFilterFromDeviceClass", "CreateFromIdAsyncWithKindAndAdditionalProperties", "FindAllAsyncWithKindAqsFilterAndAdditionalProperties", "CreateWatcherWithKindAqsFilterAndAdditionalProperties"]

    /**
     * 
     * @param {Integer} deviceClass_ 
     * @returns {HSTRING} 
     */
    GetAqsFilterFromDeviceClass(deviceClass_) {
        aqsFilter := HSTRING()
        result := ComCall(6, this, "int", deviceClass_, "ptr", aqsFilter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return aqsFilter
    }

    /**
     * 
     * @param {HSTRING} deviceId 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @param {Integer} kind 
     * @returns {IAsyncOperation<DeviceInformation>} 
     */
    CreateFromIdAsyncWithKindAndAdditionalProperties(deviceId, additionalProperties, kind) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(7, this, "ptr", deviceId, "ptr", additionalProperties, "int", kind, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformation, asyncOp)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @param {Integer} kind 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     */
    FindAllAsyncWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(8, this, "ptr", aqsFilter, "ptr", additionalProperties, "int", kind, "ptr*", &asyncOp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DeviceInformationCollection, asyncOp)
    }

    /**
     * 
     * @param {HSTRING} aqsFilter 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @param {Integer} kind 
     * @returns {DeviceWatcher} 
     */
    CreateWatcherWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind) {
        if(aqsFilter is String) {
            pin := HSTRING.Create(aqsFilter)
            aqsFilter := pin.Value
        }
        aqsFilter := aqsFilter is Win32Handle ? NumGet(aqsFilter, "ptr") : aqsFilter

        result := ComCall(9, this, "ptr", aqsFilter, "ptr", additionalProperties, "int", kind, "ptr*", &watcher := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceWatcher(watcher)
    }
}
