#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMMDeviceCollection.ahk
#Include .\IMMDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDeviceEnumerator interface provides methods for enumerating multimedia device resources.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdeviceenumerator
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMDeviceEnumerator
     * @type {Guid}
     */
    static IID => Guid("{a95664d2-9614-4f35-a746-de8db63617e6}")

    /**
     * The class identifier for MMDeviceEnumerator
     * @type {Guid}
     */
    static CLSID => Guid("{bcde0395-e52f-467c-8e3d-c4579291692e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAudioEndpoints", "GetDefaultAudioEndpoint", "GetDevice", "RegisterEndpointNotificationCallback", "UnregisterEndpointNotificationCallback"]

    /**
     * The EnumAudioEndpoints method generates a collection of audio endpoint devices that meet the specified criteria.
     * @param {Integer} dataFlow The data-flow direction for the endpoint devices in the collection. The caller should set this parameter to one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">EDataFlow</a> enumeration values:
     * 
     * eRender
     * 
     * eCapture
     * 
     * eAll
     * 
     * If the caller specifies eAll, the method includes both rendering and capture endpoints in the collection.
     * @param {Integer} dwStateMask The state or states of the endpoints that are to be included in the collection. The caller should set this parameter to the bitwise OR of one or more of the following <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-state-xxx-constants">DEVICE_STATE_XXX</a> constants:
     * 
     * DEVICE_STATE_ACTIVE
     * 
     * DEVICE_STATE_DISABLED
     * 
     * DEVICE_STATE_NOTPRESENT
     * 
     * DEVICE_STATE_UNPLUGGED
     * 
     * For example, if the caller sets the <i>dwStateMask</i> parameter to DEVICE_STATE_ACTIVE | DEVICE_STATE_UNPLUGGED, the method includes endpoints that are either active or unplugged from their jacks, but excludes endpoints that are on audio adapters that have been disabled or are not present. To include all endpoints, regardless of state, set <i>dwStateMask</i> = DEVICE_STATEMASK_ALL.
     * @returns {IMMDeviceCollection} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevicecollection">IMMDeviceCollection</a> interface of the device-collection object. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>EnumAudioEndpoints</b> call fails,  <i>*ppDevices</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints
     */
    EnumAudioEndpoints(dataFlow, dwStateMask) {
        result := ComCall(3, this, "int", dataFlow, "uint", dwStateMask, "ptr*", &ppDevices := 0, "HRESULT")
        return IMMDeviceCollection(ppDevices)
    }

    /**
     * The GetDefaultAudioEndpoint method retrieves the default audio endpoint for the specified data-flow direction and role.
     * @param {Integer} dataFlow The data-flow direction for the endpoint device. The caller should set this parameter to one of the following two <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-edataflow">EDataFlow</a> enumeration values:
     * 
     * eRender
     * 
     * eCapture
     * 
     * The data-flow direction for a rendering device is eRender. The data-flow direction for a capture device is eCapture.
     * @param {Integer} role The role of the endpoint device. The caller should set this parameter to one of the following <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">ERole</a> enumeration values:
     * 
     * eConsole
     * 
     * eMultimedia
     * 
     * eCommunications
     * 
     * For more information, see Remarks.
     * @returns {IMMDevice} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface of the endpoint object for the default audio endpoint device. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetDefaultAudioEndpoint</b> call fails,  <i>*ppDevice</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdefaultaudioendpoint
     */
    GetDefaultAudioEndpoint(dataFlow, role) {
        result := ComCall(4, this, "int", dataFlow, "int", role, "ptr*", &ppEndpoint := 0, "HRESULT")
        return IMMDevice(ppEndpoint)
    }

    /**
     * The GetDevice method retrieves an audio endpoint device that is identified by an endpoint ID string.
     * @param {PWSTR} pwstrId Pointer to a string containing the endpoint ID. The caller typically obtains this string from the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid">IMMDevice::GetId</a> method or from one of the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient">IMMNotificationClient</a> interface.
     * @returns {IMMDevice} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface for the specified device. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetDevice</b> call fails,  <i>*ppDevice</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdevice
     */
    GetDevice(pwstrId) {
        pwstrId := pwstrId is String ? StrPtr(pwstrId) : pwstrId

        result := ComCall(5, this, "ptr", pwstrId, "ptr*", &ppDevice := 0, "HRESULT")
        return IMMDevice(ppDevice)
    }

    /**
     * The RegisterEndpointNotificationCallback method registers a client's notification callback interface.
     * @param {IMMNotificationClient} pClient Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient">IMMNotificationClient</a> interface that the client is registering for notification callbacks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pNotify</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-registerendpointnotificationcallback
     */
    RegisterEndpointNotificationCallback(pClient) {
        result := ComCall(6, this, "ptr", pClient, "HRESULT")
        return result
    }

    /**
     * The UnregisterEndpointNotificationCallback method deletes the registration of a notification interface that the client registered in a previous call to the IMMDeviceEnumerator::RegisterEndpointNotificationCallback method.
     * @param {IMMNotificationClient} pClient Pointer to the client's <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient">IMMNotificationClient</a> interface. The client passed this same interface pointer to the device enumerator in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-registerendpointnotificationcallback">IMMDeviceEnumerator::RegisterEndpointNotificationCallback</a> method. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pNotify</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified notification interface was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-unregisterendpointnotificationcallback
     */
    UnregisterEndpointNotificationCallback(pClient) {
        result := ComCall(7, this, "ptr", pClient, "HRESULT")
        return result
    }
}
