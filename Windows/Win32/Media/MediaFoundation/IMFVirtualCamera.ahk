#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSource.ahk
#Include .\IMFCameraSyncObject.ahk
#Include .\IMFAttributes.ahk

/**
 * Represents a virtual camera that can be plugged into the Media Foundation frame server pipeline.
 * @remarks
 * Create an instance of **IMFVirtualCamera** by calling [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md). When this interface is returned from **MFCreateVirtualCamera** for the first time, the interface represents a set of configuration options.  The caller is responsible for configuring the different settings on the virtual camera before starting the camera. Calling the [IMFVirtualCamera::Start](nf-mfvirtualcamera-imfvirtualcamera-start.md) method allows the camera to be discoverable and activatable on the device.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nn-mfvirtualcamera-imfvirtualcamera
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
     * Informs the pipeline the virtual camera will require exclusive control to the physical camera specified by the specified device symbolic name.
     * @remarks
     * The function allows the Windows Camera Frame Server service to arbitrate access to the physical camera when the virtual camera is activated.
     * 
     * This API may be called repeatedly if the virtual camera requires exclusive access to more than one physical camera.
     * 
     * > [!NOTE]
     * > When the virtual camera is activated all physical cameras added to the virtual camera using this API will be marked as in use.  So any attempt to access those physical cameras in non-shared mode will result in a sharing violation.
     * @param {PWSTR} DeviceSourceInfo A **LPCWSTR** containing the symbolic name for the physical camera. This value is enumerated through the standard Windows enumeration APIs such as [MFEnumDeviceSources](../mfidl/nf-mfidl-mfenumdevicesources.md) and [DeviceInformation](/uwp/api/Windows.Devices.Enumeration.DeviceInformation)
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * | E_INVALIDARG | An input parameter is invalid. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-adddevicesourceinfo
     */
    AddDeviceSourceInfo(DeviceSourceInfo) {
        DeviceSourceInfo := DeviceSourceInfo is String ? StrPtr(DeviceSourceInfo) : DeviceSourceInfo

        result := ComCall(33, this, "ptr", DeviceSourceInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds custom device interface properties to the virtual camera.
     * @remarks
     * Callers must have administrator-level permissions to use this API. UWP and packaged apps do not have permissions to call this method.
     * 
     * Callers should use caution when adding known Windows device properties as this may have unintended effects.
     * @param {Pointer<DEVPROPKEY>} pKey Pointer to a [DEVPROPKEY](/windows-hardware/drivers/install/devpropkey) to add to the virtual camera device interface. For more information, see [Unified Device Property Model](/windows-hardware/drivers/install/unified-device-property-model--windows-vista-and-later-).
     * @param {Integer} Type Property type for the specified *pKey*.  The [DEVPROP_TYPE_NULL](/windows-hardware/drivers/install/devprop-type-null) and [DEVPROP_TYPE_EMPTY](/windows-hardware/drivers/install/devprop-type-empty) types are not supported.
     * @param {Pointer} pbData Pointer to the property data.
     * @param {Integer} cbData Size in bytes contained in the buffer pointed to by *data*.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * | E_INVALIDARG | An input parameter is invalid. |
     * | E_ACCESSDENIED | Caller has insufficient permissions to add properties. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-addproperty
     */
    AddProperty(pKey, Type, pbData, cbData) {
        result := ComCall(34, this, "ptr", pKey, "uint", Type, "ptr", pbData, "uint", cbData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a custom registry entry to the device interface registry key.
     * @remarks
     * Callers must have administrator-level permissions to use this API. UWP and packaged apps do not have permissions to call this method.
     * @param {PWSTR} EntryName A null-terminated Unicode string representing the registry entry name.
     * @param {PWSTR} SubkeyPath Optional null-terminated Unicode string representing a subkey under the device interface registry node.
     * @param {Integer} dwRegType The data type of the registry entry. The **REG_NONE** type is not supported. For more information, see [Registry Value Types](/windows/win32/sysinfo/registry-value-types).
     * @param {Pointer} pbData Pointer to the data for the registry entry.
     * @param {Integer} cbData Size of the data in the buffer pointed to by *pbData*, in bytes.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * | E_INVALIDARG | An input parameter is invalid. |
     * | E_ACCESSDENIED | Caller has insufficient permissions to add properties. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-addregistryentry
     */
    AddRegistryEntry(EntryName, SubkeyPath, dwRegType, pbData, cbData) {
        EntryName := EntryName is String ? StrPtr(EntryName) : EntryName
        SubkeyPath := SubkeyPath is String ? StrPtr(SubkeyPath) : SubkeyPath

        result := ComCall(35, this, "ptr", EntryName, "ptr", SubkeyPath, "uint", dwRegType, "ptr", pbData, "uint", cbData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates and registers the virtual camera.
     * @remarks
     * Until a successful call to the **Start** method has been made, the [IMFVirtualCamera](nn-mfvirtualcamera-imfvirtualcamera.md) represents the virtual camera configuration information and the underlying virtual camera does not yet exist - unless the [MFCreateVirtualCamera](nf-mfvirtualcamera-mfcreatevirtualcamera.md) is re-opening an existing virtual camera.
     * Once **Start** has been called successfully, the [IMFAttributes](../mfobjects/nn-mfobjects-imfattributes.md) that **IMFVirtualCamera** inherits from will contain the newly created virtual camera’s symbolic link name,  [MF_DEVSOURCE_ATTRIBUTE_SOURCE_TYPE_VIDCAP_SYMBOLIC_LINK](/windows/win32/medfound/mf-devsource-attribute-source-type-vidcap-symbolic-link).  
     * 
     * If **MFCreateVirtualCamera** is called with the same parameters as a prior call, specifying a **IMFVirtualCamera** that was already started with a successful call to **IMFVirtualCamera::Start**, the result **IMFVirtualCamera** is already in a valid state and subsequent calls to **IMFVirtualCamera::Start** may be used to register new callbacks.
     * @param {IMFAsyncCallback} pCallback Optional pointer to an [IMFAsyncCallback](../mfobjects/nn-mfobjects-imfasynccallback.md) object that the pipeline will use to notify the caller of the state of the virtual camera. The callback, if provided, may be invoked with a [IMFMediaEvent](../mfobjects/nn-mfobjects-imfmediaevent.md).  When invoked, the [IMFMediaEvent::GetType](../mfobjects/nf-mfobjects-imfmediaevent-gettype.md) method will return an [MEExtendedType](/windows/win32/medfound/meextendedtype) or an [MEError](/windows/win32/medfound/meerror).  If an **MEExtendedType** is returned, the [IMFMediaEvent::GetExtendedType](../mfobjects/nf-mfobjects-imfmediaevent-getextendedtype.md) method may return one of the following event types:
     * 
     * | Extended event type | Description |
     * |---------------------|-----------------|
     * | MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_INITIALIZE | The custom media source representing the virtual camera was initialized by an application. | 
     * | MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_START | A stream (or streams) on the virtual camera’s custom media source was started by an application. |
     * | MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_STOP | All streams on the virtual camera’s custom media source were stopped by the application. |
     * | MF_FRAMESERVER_VCAMEVENT_EXTENDED_SOURCE_UNINITIALIZE | The virtual camera’s custom media source was uninitialized. |
     * | MF_FRAMESERVER_VCAMEVENT_EXTENDED_PIPELINE_SHUTDOWN | The virtual camera’s pipeline was shutdown. |
     * | MF_FRAMESERVER_VCAMEVENT_EXTENDED_CUSTOM_EVENT | A custom event was generated by the virtual camera’s custom media source.  The schema for the **IMFMediaEvent** is vendor specific. |
     * 
     * The callback may be called at any time after the **IMFVirtualCamera::Start** has successfully returned.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * | E_INVALIDARG | An input parameter is invalid. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-start
     */
    Start(pCallback) {
        result := ComCall(36, this, "ptr", pCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables the registered virtual camera, blocking apps from being able to enumerate or activate the virtual camera.
     * @remarks
     * Calling **Stop** while the virtual camera is in use will result in those applications receiving a MF_E_VIDEO_RECORDING_DEVICE_INVALIDATED error.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * | E_ACCESSDENIED | The virtual camera is a system wide camera and the caller does not have permissions to remove it.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-stop
     */
    Stop() {
        result := ComCall(37, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disables and unregisters the virtual camera from the system.
     * @remarks
     * Applications that create virtual cameras during their lifetime should ensure that their virtual cameras are removed when the application is uninstalled.
     * 
     * Calling **Remove** while the virtual camera is in use will result in those applications receiving a MF_E_VIDEO_RECORDING_DEVICE_INVALIDATED error.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * | E_ACCESSDENIED | The virtual camera is a system wide camera and the caller does not have permissions to remove it. |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-remove
     */
    Remove() {
        result := ComCall(38, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an IMFMediaSource that provides media data from the virtual camera.
     * @remarks
     * **GetMediaSource** may not be called until after [IMFVirtualCamera::Start](nf-mfvirtualcamera-imfvirtualcamera-start.md) has been successfully called. The **IMFMediaSource** returned in the *ppMediaSource* parameter is a media source that has reduced functionality.  It is internally marked as a shared client.  This media source is intended for apps to use as a local preview during virtual camera activation and configuration process.
     * 
     * If a full function **IMFMediaSource** is needed, the app must call [MFCreateDeviceSource](../mfidl/nf-mfidl-mfcreatedevicesource.md) using the symbolic link name returned in the **IMFAttributes** after a **IMFVirtualCamera::Start** call.  Doing so, however will result in an exclusive-control media source being created which, when activated, will lock out all other apps from using the virtual camera.
     * 
     * The lifetime of the **IMFMediaSource** retrieved by this method is directly tied to the lifetime of the [IMFVirtualCamera](nn-mfvirtualcamera-imfvirtualcamera.md) from which it is obtained.  If the **IMFVirtualCamera** is disposed or [IMFVirtualCamera::Shutdown](nf-mfvirtualcamera-imfvirtualcamera-shutdown.md) is called, the IMFMediaSource obtained from this method will also be shutdown.
     * @returns {Pointer<IMFMediaSource>} A shared-client **IMFMediaSource** from the virtual camera.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-getmediasource
     */
    GetMediaSource() {
        result := ComCall(39, this, "ptr*", &ppMediaSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppMediaSource
    }

    /**
     * A wrapper around the internal IKsControl::KsProperty method.
     * @param {Pointer<Guid>} propertySet A GUID representing the [KSPROPERTY.Set](/windows-hardware/drivers/stream/ksmethod-structure) field.
     * @param {Integer} propertyId A ULONG representing the **KSPROPERTY.Id** field.
     * @param {Integer} propertyFlags A set of bit-wise or-ed flags representing the **KSPROPERTY.Flags** field.
     * @param {Pointer} propertyPayload Extended data added to the end of the **KSPROPERTY** structure. Any property payload provided will be added to the end of the **KSPROPERTY** structure before being sent to the virtual camera’s custom media source
     * @param {Integer} propertyPayloadLength The size in bytes of the buffer pointed to by *propertyPayload*.
     * @param {Pointer} data The byte buffer for the payload of the property.
     * @param {Integer} dataLength The size in bytes of the buffer pointed to by *data*.
     * @returns {Integer} An output parameter indicating the amount of data written to the data buffer.  This value is only valid when *commandFlags* contains a GET or query operation.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-sendcameraproperty
     */
    SendCameraProperty(propertySet, propertyId, propertyFlags, propertyPayload, propertyPayloadLength, data, dataLength) {
        result := ComCall(40, this, "ptr", propertySet, "uint", propertyId, "uint", propertyFlags, "ptr", propertyPayload, "uint", propertyPayloadLength, "ptr", data, "uint", dataLength, "uint*", &dataWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return dataWritten
    }

    /**
     * A wrapper around the IKsControl::KsEvent method, which enables or disables an event.
     * @remarks
     * This method allows the caller to create a event object between the caller and the virtual camera for synchronization.  The virtual camera implementation will receive a call to **IKsControl::KsEvent** when this API is called. The resulting [IMFCameraSyncObject](nn-mfvirtualcamera-imfcamerasyncobject.md) can be used to block on the event from the virtual camera.
     * 
     * 
     * When the **IMFCameraSyncObject** is obtained, the caller may choose to use the [IMFCameraSyncObject::WaitOnSignal](nf-mfvirtualcamera-imfcamerasyncobject-waitonsignal.md) method or call [WaitForSingleObject](../synchapi/nf-synchapi-waitforsingleobject.md) or [WaitForMultipleObjects](../synchapi/nf-synchapi-waitformultipleobjects.md) on the HANDLE that was provided to the **CreateSyncObject** method.  The caller must not wait on both, as the signal on the event may only be set once by the driver.
     * 
     * The caller must call [IMFCameraSyncObject::Shutdown](nf-mfvirtualcamera-imfvirtualcamera-shutdown.md) when the synchronization object is no longer needed regardless of whether the wait operation succeeded or not.
     * @param {Pointer<Guid>} kseventSet A GUID representing the [KSEVENT.Set](/previous-versions/ff561744(v=vs.85)) field.
     * @param {Integer} kseventId A ULONG representing the **KSEVENT.Id** field.
     * @param {Integer} kseventFlags A set of bit-wise or-ed flags representing the **KSEVENT.Flags** field.
     * @param {HANDLE} eventHandle A Handle representing the [KSEVENTDATA.EventHandle.Event](/windows-hardware/drivers/ddi/ks/ns-ks-kseventdata) field.
     * @returns {Pointer<IMFCameraSyncObject>} An output parameter that receives an [IMFSyncObject](nn-mfvirtualcamera-imfcamerasyncobject.md) interface.  The caller is responsible for releasing this object.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-createsyncevent
     */
    CreateSyncEvent(kseventSet, kseventId, kseventFlags, eventHandle) {
        eventHandle := eventHandle is Win32Handle ? NumGet(eventHandle, "ptr") : eventHandle

        result := ComCall(41, this, "ptr", kseventSet, "uint", kseventId, "uint", kseventFlags, "ptr", eventHandle, "ptr*", &cameraSyncObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cameraSyncObject
    }

    /**
     * A wrapper around the IKsControl::KsEvent method, which enables or disables a semaphore.
     * @remarks
     * This method allows the caller to create a semaphore object between the caller and the virtual camera for synchronization.  The virtual camera implementation will receive a call to **IKsControl::KsEvent** when this API is called. The resulting [IMFCameraSyncObject](nn-mfvirtualcamera-imfcamerasyncobject.md) can be used to block on the event from the virtual camera.
     * 
     * 
     * When the **IMFCameraSyncObject** is obtained, the caller may choose to use the [IMFCameraSyncObject::WaitOnSignal](nf-mfvirtualcamera-imfcamerasyncobject-waitonsignal.md) method or call [WaitForSingleObject](../synchapi/nf-synchapi-waitforsingleobject.md) or [WaitForMultipleObjects](../synchapi/nf-synchapi-waitformultipleobjects.md) on the HANDLE that was provided to the **CreateSyncObject** method.  The caller must not wait on both, as the signal on the event may only be set once by the driver.
     * 
     * The caller must call [IMFCameraSyncObject::Shutdown](nf-mfvirtualcamera-imfvirtualcamera-shutdown.md) when the synchronization object is no longer needed regardless of whether the wait operation succeeded or not.
     * @param {Pointer<Guid>} kseventSet A GUID representing the [KSEVENT.Set](/windows-hardware/drivers/stream/ksevent-structure) field.
     * @param {Integer} kseventId A ULONG representing the **KSEVENT.Id** field.
     * @param {Integer} kseventFlags A set of bit-wise or-ed flags representing the **KSEVENT.Flags** field.
     * @param {HANDLE} semaphoreHandle A handle representing the **KSEVENTDATA.SemaphoreHandle.Semaphore** field.
     * @param {Integer} semaphoreAdjustment An adjustment value representing the **KSEVENTDATA.SemaphoreHandle.Adjustment** field.
     * @returns {Pointer<IMFCameraSyncObject>} An output parameter that receives an [IMFSyncObject](nn-mfvirtualcamera-imfcamerasyncobject.md) interface.  The caller is responsible for releasing this object.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore
     */
    CreateSyncSemaphore(kseventSet, kseventId, kseventFlags, semaphoreHandle, semaphoreAdjustment) {
        semaphoreHandle := semaphoreHandle is Win32Handle ? NumGet(semaphoreHandle, "ptr") : semaphoreHandle

        result := ComCall(42, this, "ptr", kseventSet, "uint", kseventId, "uint", kseventFlags, "ptr", semaphoreHandle, "int", semaphoreAdjustment, "ptr*", &cameraSyncObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cameraSyncObject
    }

    /**
     * Releases all of the virtual camera's internal resources.
     * @remarks
     * When **Shutdown** is called, all objects created through the **IMFVirtualCamera** APIs will also be shutdown. This includes [IMFCameraSyncObject](nn-mfvirtualcamera-imfcamerasyncobject.md) objects obtained through calls to [IMFVirtualCamera::CreateSyncEvent](nf-mfvirtualcamera-imfvirtualcamera-createsyncevent.md) or [CreateSyncSemaphore](nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore.md) and [IMFMediaSource](../mfidl/nn-mfidl-imfmediasource.md) objects obtained through a call to [IMFVirtualCamera::GetMediaSource](nf-mfvirtualcamera-imfvirtualcamera-getmediasource.md).  Attempts to use any object obtained from the **IMFVirtualCamera** after **Shutdown** has been called will result in an MF_E_SHUTDOWN error.
     * 
     * For virtual cameras created with a lifetime value of [MFVirtualCameraLifeTime_Session](ne-mfvirtualcamera-mfvirtualcameralifetime.md), when **Shutdown** is called, the virtual camera will be removed from the system.  Any application using the virtual camera will receive the device invalidated error MF_E_VIDEO_RECORDING_DEVICE_INVALIDATED.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfvirtualcamera-shutdown
     */
    Shutdown() {
        result := ComCall(43, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
