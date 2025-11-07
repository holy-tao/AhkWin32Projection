#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSource.ahk
#Include .\IMFCameraSyncObject.ahk
#Include .\IMFAttributes.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nn-mfvirtualcamera-imfvirtualcamera
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVirtualCamera extends IMFAttributes{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddDeviceSourceInfo", "AddProperty", "AddRegistryEntry", "Start", "Stop", "Remove", "GetMediaSource", "SendCameraProperty", "CreateSyncEvent", "CreateSyncSemaphore", "Shutdown"]

    /**
     * 
     * @param {PWSTR} DeviceSourceInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-adddevicesourceinfo
     */
    AddDeviceSourceInfo(DeviceSourceInfo) {
        DeviceSourceInfo := DeviceSourceInfo is String ? StrPtr(DeviceSourceInfo) : DeviceSourceInfo

        result := ComCall(33, this, "ptr", DeviceSourceInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pKey 
     * @param {Integer} Type 
     * @param {Pointer} pbData 
     * @param {Integer} cbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-addproperty
     */
    AddProperty(pKey, Type, pbData, cbData) {
        result := ComCall(34, this, "ptr", pKey, "uint", Type, "ptr", pbData, "uint", cbData, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-addregistryentry
     */
    AddRegistryEntry(EntryName, SubkeyPath, dwRegType, pbData, cbData) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName
        SubkeyPath := SubkeyPath is String ? StrPtr(SubkeyPath) : SubkeyPath

        result := ComCall(35, this, "ptr", EntryName, "ptr", SubkeyPath, "uint", dwRegType, "ptr", pbData, "uint", cbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFAsyncCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-start
     */
    Start(pCallback) {
        result := ComCall(36, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-stop
     */
    Stop() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-remove
     */
    Remove() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMFMediaSource} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-getmediasource
     */
    GetMediaSource() {
        result := ComCall(39, this, "ptr*", &ppMediaSource := 0, "HRESULT")
        return IMFMediaSource(ppMediaSource)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-sendcameraproperty
     */
    SendCameraProperty(propertySet, propertyId, propertyFlags, propertyPayload, propertyPayloadLength, data, dataLength) {
        result := ComCall(40, this, "ptr", propertySet, "uint", propertyId, "uint", propertyFlags, "ptr", propertyPayload, "uint", propertyPayloadLength, "ptr", data, "uint", dataLength, "uint*", &dataWritten := 0, "HRESULT")
        return dataWritten
    }

    /**
     * 
     * @param {Pointer<Guid>} kseventSet 
     * @param {Integer} kseventId 
     * @param {Integer} kseventFlags 
     * @param {HANDLE} eventHandle 
     * @returns {IMFCameraSyncObject} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-createsyncevent
     */
    CreateSyncEvent(kseventSet, kseventId, kseventFlags, eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(41, this, "ptr", kseventSet, "uint", kseventId, "uint", kseventFlags, "ptr", eventHandle, "ptr*", &cameraSyncObject := 0, "HRESULT")
        return IMFCameraSyncObject(cameraSyncObject)
    }

    /**
     * 
     * @param {Pointer<Guid>} kseventSet 
     * @param {Integer} kseventId 
     * @param {Integer} kseventFlags 
     * @param {HANDLE} semaphoreHandle 
     * @param {Integer} semaphoreAdjustment 
     * @returns {IMFCameraSyncObject} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore
     */
    CreateSyncSemaphore(kseventSet, kseventId, kseventFlags, semaphoreHandle, semaphoreAdjustment) {
        semaphoreHandle := semaphoreHandle is Win32Handle ? NumGet(semaphoreHandle, "ptr") : semaphoreHandle

        result := ComCall(42, this, "ptr", kseventSet, "uint", kseventId, "uint", kseventFlags, "ptr", semaphoreHandle, "int", semaphoreAdjustment, "ptr*", &cameraSyncObject := 0, "HRESULT")
        return IMFCameraSyncObject(cameraSyncObject)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-shutdown
     */
    Shutdown() {
        result := ComCall(43, this, "HRESULT")
        return result
    }
}
