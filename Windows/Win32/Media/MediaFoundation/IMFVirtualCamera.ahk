#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVirtualCamera extends IMFAttributes{
    /**
     * The interface identifier for IMFVirtualCamera
     * @type {Guid}
     */
    static IID => Guid("{1c08a864-ef6c-4c75-af59-5f2d68da9563}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * 
     * @param {PWSTR} DeviceSourceInfo 
     * @returns {HRESULT} 
     */
    AddDeviceSourceInfo(DeviceSourceInfo) {
        DeviceSourceInfo := DeviceSourceInfo is String ? StrPtr(DeviceSourceInfo) : DeviceSourceInfo

        result := ComCall(33, this, "ptr", DeviceSourceInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pKey 
     * @param {Integer} Type 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    AddProperty(pKey, Type, pbData, cbData) {
        result := ComCall(34, this, "ptr", pKey, "uint", Type, "ptr", pbData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} EntryName 
     * @param {PWSTR} SubkeyPath 
     * @param {Integer} dwRegType 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     */
    AddRegistryEntry(EntryName, SubkeyPath, dwRegType, pbData, cbData) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName
        SubkeyPath := SubkeyPath is String ? StrPtr(SubkeyPath) : SubkeyPath

        result := ComCall(35, this, "ptr", EntryName, "ptr", SubkeyPath, "uint", dwRegType, "ptr", pbData, "uint", cbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @returns {HRESULT} 
     */
    Start(pCallback) {
        result := ComCall(36, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Remove() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaSource>} ppMediaSource 
     * @returns {HRESULT} 
     */
    GetMediaSource(ppMediaSource) {
        result := ComCall(39, this, "ptr", ppMediaSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} propertySet 
     * @param {Integer} propertyId 
     * @param {Integer} propertyFlags 
     * @param {Pointer} propertyPayload 
     * @param {Integer} propertyPayloadLength 
     * @param {Pointer} data 
     * @param {Integer} dataLength 
     * @param {Pointer<UInt32>} dataWritten 
     * @returns {HRESULT} 
     */
    SendCameraProperty(propertySet, propertyId, propertyFlags, propertyPayload, propertyPayloadLength, data, dataLength, dataWritten) {
        result := ComCall(40, this, "ptr", propertySet, "uint", propertyId, "uint", propertyFlags, "ptr", propertyPayload, "uint", propertyPayloadLength, "ptr", data, "uint", dataLength, "uint*", dataWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} kseventSet 
     * @param {Integer} kseventId 
     * @param {Integer} kseventFlags 
     * @param {HANDLE} eventHandle 
     * @param {Pointer<IMFCameraSyncObject>} cameraSyncObject 
     * @returns {HRESULT} 
     */
    CreateSyncEvent(kseventSet, kseventId, kseventFlags, eventHandle, cameraSyncObject) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(41, this, "ptr", kseventSet, "uint", kseventId, "uint", kseventFlags, "ptr", eventHandle, "ptr", cameraSyncObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} kseventSet 
     * @param {Integer} kseventId 
     * @param {Integer} kseventFlags 
     * @param {HANDLE} semaphoreHandle 
     * @param {Integer} semaphoreAdjustment 
     * @param {Pointer<IMFCameraSyncObject>} cameraSyncObject 
     * @returns {HRESULT} 
     */
    CreateSyncSemaphore(kseventSet, kseventId, kseventFlags, semaphoreHandle, semaphoreAdjustment, cameraSyncObject) {
        semaphoreHandle := semaphoreHandle is Win32Handle ? NumGet(semaphoreHandle, "ptr") : semaphoreHandle

        result := ComCall(42, this, "ptr", kseventSet, "uint", kseventId, "uint", kseventFlags, "ptr", semaphoreHandle, "int", semaphoreAdjustment, "ptr", cameraSyncObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(43, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
