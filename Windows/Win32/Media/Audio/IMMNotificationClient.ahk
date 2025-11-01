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
     * 
     * @param {PWSTR} pwstrDeviceId 
     * @param {Integer} dwNewState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondevicestatechanged
     */
    OnDeviceStateChanged(pwstrDeviceId, dwNewState) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(3, this, "ptr", pwstrDeviceId, "uint", dwNewState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondeviceadded
     */
    OnDeviceAdded(pwstrDeviceId) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(4, this, "ptr", pwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondeviceremoved
     */
    OnDeviceRemoved(pwstrDeviceId) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(5, this, "ptr", pwstrDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flow 
     * @param {Integer} role 
     * @param {PWSTR} pwstrDefaultDeviceId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-ondefaultdevicechanged
     */
    OnDefaultDeviceChanged(flow, role, pwstrDefaultDeviceId) {
        pwstrDefaultDeviceId := pwstrDefaultDeviceId is String ? StrPtr(pwstrDefaultDeviceId) : pwstrDefaultDeviceId

        result := ComCall(6, this, "int", flow, "int", role, "ptr", pwstrDefaultDeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrDeviceId 
     * @param {PROPERTYKEY} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immnotificationclient-onpropertyvaluechanged
     */
    OnPropertyValueChanged(pwstrDeviceId, key) {
        pwstrDeviceId := pwstrDeviceId is String ? StrPtr(pwstrDeviceId) : pwstrDeviceId

        result := ComCall(7, this, "ptr", pwstrDeviceId, "ptr", key, "HRESULT")
        return result
    }
}
