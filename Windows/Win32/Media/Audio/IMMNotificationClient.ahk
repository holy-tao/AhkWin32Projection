#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMNotificationClient interface provides notifications when an audio endpoint device is added or removed, when the state or properties of an endpoint device change, or when there is a change in the default role assigned to an endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immnotificationclient
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMNotificationClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMNotificationClient
     * @type {Guid}
     */
    static IID => Guid("{7991eec9-7e89-4d85-8390-6c703cec60c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDeviceStateChanged", "OnDeviceAdded", "OnDeviceRemoved", "OnDefaultDeviceChanged", "OnPropertyValueChanged"]

    /**
     * The OnDeviceStateChanged method indicates that the state of an audio endpoint device has changed.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call.
     * @param {Integer} dwNewState Specifies the new state of the endpoint device. The value of this parameter is one of the following <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-state-xxx-constants">DEVICE_STATE_XXX</a> constants:
     * 
     * DEVICE_STATE_ACTIVE
     * 
     * DEVICE_STATE_DISABLED
     * 
     * DEVICE_STATE_NOTPRESENT
     * 
     * DEVICE_STATE_UNPLUGGED
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondevicestatechanged
     */
    OnDeviceStateChanged(pwstrDeviceId, dwNewState) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(3, this, "ptr", pwstrDeviceId, "uint", dwNewState, "HRESULT")
        return result
    }

    /**
     * The OnDeviceAdded method indicates that a new audio endpoint device has been added.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondeviceadded
     */
    OnDeviceAdded(pwstrDeviceId) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(4, this, "ptr", pwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * The OnDeviceRemoved method indicates that an audio endpoint device has been removed.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondeviceremoved
     */
    OnDeviceRemoved(pwstrDeviceId) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(5, this, "ptr", pwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * The OnDefaultDeviceChanged method notifies the client that the default audio endpoint device for a particular device role has changed.
     * @param {Integer} flow The data-flow direction of the endpoint device. This parameter is set to one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">EDataFlow</a> enumeration values:
     * 
     * eRender
     * 
     * eCapture
     * 
     * The data-flow direction for a rendering device is eRender. The data-flow direction for a capture device is eCapture.
     * @param {Integer} role The <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">device role</a> of the audio endpoint device. This parameter is set to one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">ERole</a> enumeration values:
     * 
     * eConsole
     * 
     * eMultimedia
     * 
     * eCommunications
     * @param {PWSTR} pwstrDefaultDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string containing the endpoint ID. The string remains valid for the duration of the call. If the user has removed or disabled the default device for a particular role, and no other device is available to assume that role, then <i>pwstrDefaultDevice</i> is <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondefaultdevicechanged
     */
    OnDefaultDeviceChanged(flow, role, pwstrDefaultDeviceId) {
        pwstrDefaultDeviceId := pwstrDefaultDeviceId is String ? StrPtr(pwstrDefaultDeviceId) : pwstrDefaultDeviceId

        result := ComCall(6, this, "int", flow, "int", role, "ptr", pwstrDefaultDeviceId, "HRESULT")
        return result
    }

    /**
     * The OnPropertyValueChanged method indicates that the value of a property belonging to an audio endpoint device has changed.
     * @param {PWSTR} pwstrDeviceId Pointer to the <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">endpoint ID string</a> that identifies the audio endpoint device. This parameter points to a null-terminated, wide-character string that contains the endpoint ID. The string remains valid for the duration of the call.
     * @param {PROPERTYKEY} key A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure that specifies the property. The structure contains the property-set GUID and an index identifying a property within the set. The structure is passed by value. It remains valid for the duration of the call. For more information about <b>PROPERTYKEY</b>, see the Windows SDK documentation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immnotificationclient-onpropertyvaluechanged
     */
    OnPropertyValueChanged(pwstrDeviceId, key) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(7, this, "ptr", pwstrDeviceId, "ptr", key, "HRESULT")
        return result
    }
}
