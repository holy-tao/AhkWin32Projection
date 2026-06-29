#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EDataFlow.ahk" { EDataFlow }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ERole.ahk" { ERole }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEVICE_STATE.ahk" { DEVICE_STATE }

/**
 * The IMMNotificationClient interface provides notifications when an audio endpoint device is added or removed, when the state or properties of an endpoint device change, or when there is a change in the default role assigned to an endpoint device.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IMMNotificationClient extends IUnknown {
    /**
     * The interface identifier for IMMNotificationClient
     * @type {Guid}
     */
    static IID := Guid("{7991eec9-7e89-4d85-8390-6c703cec60c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMMNotificationClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDeviceStateChanged   : IntPtr
        OnDeviceAdded          : IntPtr
        OnDeviceRemoved        : IntPtr
        OnDefaultDeviceChanged : IntPtr
        OnPropertyValueChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMMNotificationClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnDeviceStateChanged method indicates that the state of an audio endpoint device has changed.
     * @remarks
     * For a code example that implements the <b>OnDeviceStateChanged</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-events">Device Events</a>.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call.
     * @param {DEVICE_STATE} dwNewState Specifies the new state of the endpoint device. The value of this parameter is one of the following <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-state-xxx-constants">DEVICE_STATE_XXX</a> constants:
     * 
     * DEVICE_STATE_ACTIVE
     * 
     * DEVICE_STATE_DISABLED
     * 
     * DEVICE_STATE_NOTPRESENT
     * 
     * DEVICE_STATE_UNPLUGGED
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondevicestatechanged
     */
    OnDeviceStateChanged(pwstrDeviceId, dwNewState) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(3, this, "ptr", pwstrDeviceId, DEVICE_STATE, dwNewState, "HRESULT")
        return result
    }

    /**
     * The OnDeviceAdded method indicates that a new audio endpoint device has been added.
     * @remarks
     * For a code example that implements the <b>OnDeviceAdded</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-events">Device Events</a>.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondeviceadded
     */
    OnDeviceAdded(pwstrDeviceId) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(4, this, "ptr", pwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * The OnDeviceRemoved method indicates that an audio endpoint device has been removed.
     * @remarks
     * For a code example that implements the <b>OnDeviceRemoved</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-events">Device Events</a>.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondeviceremoved
     */
    OnDeviceRemoved(pwstrDeviceId) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(5, this, "ptr", pwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * The OnDefaultDeviceChanged method notifies the client that the default audio endpoint device for a particular device role has changed.
     * @remarks
     * The three input parameters specify the data-flow direction, device role, and endpoint ID string of the new default audio endpoint device.
     * 
     * In Windows Vista, the MMDevice API supports device roles but the system-supplied user interface programs do not. The user interface in Windows Vista enables the user to select a default audio device for rendering and a default audio device for capture. When the user changes the default rendering or capture device, the system assigns all three device roles (eConsole, eMultimedia, and eCommunications) to the new device. Thus, when the user changes the default rendering or capture device, the system calls the client's <b>OnDefaultDeviceChanged</b> method three times—once for each of the three device roles.
     * 
     * In a future version of Windows, the user interface might enable the user to assign individual roles to different devices. In that case, if the user changes the assignment of only one or two device roles to a new rendering or capture device, the system will call the client's <b>OnDefaultDeviceChanged</b> method only once or twice (that is, one call per changed role). Depending on how the <b>OnDefaultDeviceChanged</b> method responds to role changes, the behavior of an audio application developed to run in Windows Vista might change when run in a future version of Windows. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles-in-windows-vista">Device Roles in Windows Vista</a>.
     * 
     * For a code example that implements the <b>OnDefaultDeviceChanged</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-events">Device Events</a>.
     * @param {EDataFlow} flow The data-flow direction of the endpoint device. This parameter is set to one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">EDataFlow</a> enumeration values:
     * 
     * eRender
     * 
     * eCapture
     * 
     * The data-flow direction for a rendering device is eRender. The data-flow direction for a capture device is eCapture.
     * @param {ERole} role The <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">device role</a> of the audio endpoint device. This parameter is set to one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">ERole</a> enumeration values:
     * 
     * eConsole
     * 
     * eMultimedia
     * 
     * eCommunications
     * @param {PWSTR} pwstrDefaultDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call. If the user has removed or disabled the default device for a particular role, and no other device is available to assume that role, then <i>pwstrDefaultDevice</i> is <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondefaultdevicechanged
     */
    OnDefaultDeviceChanged(flow, role, pwstrDefaultDeviceId) {
        pwstrDefaultDeviceId := pwstrDefaultDeviceId is String ? StrPtr(pwstrDefaultDeviceId) : pwstrDefaultDeviceId

        result := ComCall(6, this, EDataFlow, flow, ERole, role, "ptr", pwstrDefaultDeviceId, "HRESULT")
        return result
    }

    /**
     * The OnPropertyValueChanged method indicates that the value of a property belonging to an audio endpoint device has changed.
     * @remarks
     * A call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb761475(v=vs.85)">IPropertyStore::SetValue</a> method that successfully changes the value of a property of an audio endpoint device generates a call to <b>OnPropertyValueChanged</b>. For more information about <b>IPropertyStore::SetValue</b>, see the Windows SDK documentation.
     * 
     * A client can use the <i>key</i> parameter to retrieve the new property value. For a code example that uses a property key to retrieve a property value from the property store of an endpoint device, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-properties">Device Properties</a>.
     * 
     * For a code example that implements the <b>OnPropertyValueChanged</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-events">Device Events</a>.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string that contains the endpoint ID. The string remains valid for the duration of the call.
     * @param {PROPERTYKEY} key A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies the property. The structure contains the property-set GUID and an index identifying a property within the set. The structure is passed by value. It remains valid for the duration of the call. For more information about <b>PROPERTYKEY</b>, see the Windows SDK documentation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-onpropertyvaluechanged
     */
    OnPropertyValueChanged(pwstrDeviceId, key) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(7, this, "ptr", pwstrDeviceId, PROPERTYKEY, key, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMMNotificationClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDeviceStateChanged := CallbackCreate(GetMethod(implObj, "OnDeviceStateChanged"), flags, 3)
        this.vtbl.OnDeviceAdded := CallbackCreate(GetMethod(implObj, "OnDeviceAdded"), flags, 2)
        this.vtbl.OnDeviceRemoved := CallbackCreate(GetMethod(implObj, "OnDeviceRemoved"), flags, 2)
        this.vtbl.OnDefaultDeviceChanged := CallbackCreate(GetMethod(implObj, "OnDefaultDeviceChanged"), flags, 4)
        this.vtbl.OnPropertyValueChanged := CallbackCreate(GetMethod(implObj, "OnPropertyValueChanged"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDeviceStateChanged)
        CallbackFree(this.vtbl.OnDeviceAdded)
        CallbackFree(this.vtbl.OnDeviceRemoved)
        CallbackFree(this.vtbl.OnDefaultDeviceChanged)
        CallbackFree(this.vtbl.OnPropertyValueChanged)
    }
}
