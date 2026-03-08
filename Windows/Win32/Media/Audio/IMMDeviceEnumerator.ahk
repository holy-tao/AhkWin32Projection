#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMMDeviceCollection.ahk
#Include .\IMMDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDeviceEnumerator interface provides methods for enumerating multimedia device resources.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdeviceenumerator
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
     * @remarks
     * For example, the following call enumerates all audio-rendering endpoint devices that are currently active (present and not disabled):
     * 
     * 
     * ```cpp
     * 
     *   hr = pDevEnum->EnumAudioEndpoints(
     *                    eRender, DEVICE_STATE_ACTIVE,
     *                    &pEndpoints);
     * 
     * ```
     * 
     * 
     * In the preceding code fragment, variable <i>hr</i> is of type <b>HRESULT</b>, <i>pDevEnum</i> is a pointer to an <b>IMMDeviceEnumerator</b> interface, and <i>pEndpoints</i> is a pointer to an <b>IMMDeviceCollection</b> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints
     */
    EnumAudioEndpoints(dataFlow, dwStateMask) {
        result := ComCall(3, this, "int", dataFlow, "uint", dwStateMask, "ptr*", &ppDevices := 0, "HRESULT")
        return IMMDeviceCollection(ppDevices)
    }

    /**
     * The GetDefaultAudioEndpoint method retrieves the default audio endpoint for the specified data-flow direction and role.
     * @remarks
     * <b>Note</b>
     * 
     * In Windows Vista, the MMDevice API supports <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles">device roles</a> but the system-supplied user interface programs do not. The user interface in Windows Vista enables the user to select a default audio device for rendering and a default audio device for capture. When the user changes the default rendering or capture device, the system assigns all three device roles (eConsole, eMultimedia, and eCommunications) to that device. Thus, <b>GetDefaultAudioEndpoint</b> always selects the default rendering or capture device, regardless of which role is indicated by the <i>role</i> parameter. In a future version of Windows, the user interface might enable the user to assign individual roles to different devices. In that case, the selection of a rendering or capture device by <b>GetDefaultAudioEndpoint</b> might depend on the <i>role</i> parameter. Thus, the behavior of an audio application developed to run in Windows Vista might change when run in a future version of Windows. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles-in-windows-vista">Device Roles in Windows Vista</a>.
     * 
     * This method retrieves the default endpoint device for the specified data-flow direction (rendering or capture) and role. For example, a client can get the default console playback device by making the following call:
     * 
     * 
     * ```cpp
     * 
     *   hr = pDevEnum->GetDefaultAudioEndpoint(
     *                    eRender, eConsole, &pDeviceOut);
     * 
     * ```
     * 
     * 
     * In the preceding code fragment, variable <i>hr</i> is of type <b>HRESULT</b>, <i>pDevEnum</i> is a pointer to an <b>IMMDeviceEnumerator</b> interface, and <i>pDeviceOut</i> is a pointer to an <b>IMMDevice</b> interface.
     * 
     * A Windows system might contain some combination of audio endpoint devices such as desktop speakers, high-fidelity headphones, desktop microphones, headsets with speaker and microphones, and high-fidelity multichannel speakers. The user can assign appropriate roles to the devices. For example, an application that manages voice communications streams can call <b>GetDefaultAudioEndpoint</b> to identify the designated rendering and capture devices for that role.
     * 
     * If only a single rendering or capture device is available, the system always assigns all three rendering or capture roles to that device. If the method fails to find a rendering or capture device for the specified role, this means that no rendering or capture device is available at all. If no device is available, the method sets  <i>*ppEndpoint</i> = <b>NULL</b> and returns ERROR_NOT_FOUND.
     * 
     * For code examples that call the <b>GetDefaultAudioEndpoint</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-events-for-legacy-audio-applications">Audio Events for Legacy Audio Applications</a>
     * </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdefaultaudioendpoint
     */
    GetDefaultAudioEndpoint(dataFlow, role) {
        result := ComCall(4, this, "int", dataFlow, "int", role, "ptr*", &ppEndpoint := 0, "HRESULT")
        return IMMDevice(ppEndpoint)
    }

    /**
     * The GetDevice method retrieves an audio endpoint device that is identified by an endpoint ID string.
     * @remarks
     * If two programs are running in two different processes and both need to access the same audio endpoint device, one program cannot simply pass the device's <b>IMMDevice</b> interface to the other program. However, the programs can access the same device by following these steps:
     * 
     * <ol>
     * <li>The first program calls the <b>IMMDevice::GetId</b> method in the first process to obtain the endpoint ID string that identifies the device.</li>
     * <li>The first program passes the endpoint ID string across the process boundary to the second program.</li>
     * <li>To obtain a reference to the device's <b>IMMDevice</b> interface in the second process, the second program calls <b>GetDevice</b> with the endpoint ID string.</li>
     * </ol>
     * For more information about the <b>GetDevice</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-id-strings">Endpoint ID Strings</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-events-for-legacy-audio-applications">Audio Events for Legacy Audio Applications</a>
     * </li>
     * </ul>
     * For code examples that use the <b>GetDevice</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-properties">Device Properties</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-events">Device Events</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-ikscontrol-interface-to-access-audio-properties">Using the IKsControl Interface to Access Audio Properties</a>
     * </li>
     * </ul>
     * @param {PWSTR} pwstrId Pointer to a string containing the endpoint ID. The caller typically obtains this string from the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid">IMMDevice::GetId</a> method or from one of the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient">IMMNotificationClient</a> interface.
     * @returns {IMMDevice} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immdevice">IMMDevice</a> interface for the specified device. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetDevice</b> call fails,  <i>*ppDevice</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdevice
     */
    GetDevice(pwstrId) {
        pwstrId := pwstrId is String ? StrPtr(pwstrId) : pwstrId

        result := ComCall(5, this, "ptr", pwstrId, "ptr*", &ppDevice := 0, "HRESULT")
        return IMMDevice(ppDevice)
    }

    /**
     * The RegisterEndpointNotificationCallback method registers a client's notification callback interface.
     * @remarks
     * This method registers an IMMNotificationClient interface to be called by the system when the roles, state, existence, or properties of an endpoint device change. The caller implements the IMMNotificationClient interface.
     * 
     * When notifications are no longer needed, the client can call the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-unregisterendpointnotificationcallback">IMMDeviceEnumerator::UnregisterEndpointNotificationCallback</a> method to terminate the notifications.
     * 
     * The client must ensure that the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient">IMMNotificationClient</a> object is not released after the <b>RegisterEndpointNotificationCallback</b> call and before calling <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-unregisterendpointnotificationcallback">UnregisterEndpointNotificationCallback</a>. These methods do not call the client's <b>IMMNotificationClient::AddRef</b> and <b>IMMNotificationClient::Release</b> implementations. The client is responsible for maintaining the reference count of the <b>IMMNotificationClient</b> object. The client must increment the count if the <b>RegisterEndpointNotificationCallback</b> call succeeds and release the final reference only after calling <b>UnregisterEndpointNotificationCallback</b> or implement some other mechanism to ensure that the object is not deleted before <b>UnregisterEndpointNotificationCallback</b> is called. Otherwise, the application leaks the resources held by the <b>IMMNotificationClient</b> and any other object that is implemented in the same container. 
     * 
     * 
     * 
     * For more information about the <b>AddRef</b> and <b>Release</b> methods, see the discussion of the <b>IUnknown</b> interface in the Windows SDK documentation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-registerendpointnotificationcallback
     */
    RegisterEndpointNotificationCallback(pClient) {
        result := ComCall(6, this, "ptr", pClient, "HRESULT")
        return result
    }

    /**
     * The UnregisterEndpointNotificationCallback method deletes the registration of a notification interface that the client registered in a previous call to the IMMDeviceEnumerator::RegisterEndpointNotificationCallback method.
     * @remarks
     * The client must ensure that the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nn-mmdeviceapi-immnotificationclient">IMMNotificationClient</a> object is not released after the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-registerendpointnotificationcallback">RegisterEndpointNotificationCallback</a> call and before calling <b>UnregisterEndpointNotificationCallback</b>. These methods do not call the client's <b>IMMNotificationClient::AddRef</b> and <b>IMMNotificationClient::Release</b> implementations. The client is responsible for maintaining the reference count of the <b>IMMNotificationClient</b> object. The client must increment the count if the <b>RegisterEndpointNotificationCallback</b> call succeeds and release the final reference only after calling <b>UnregisterEndpointNotificationCallback</b> or implement some other mechanism to ensure that the object is not deleted before <b>UnregisterEndpointNotificationCallback</b> is called. Otherwise, the application leaks the resources held by the <b>IMMNotificationClient</b> and any other object that is implemented in the same container. 
     * 
     * 
     * 
     * For more information about the <b>AddRef</b> and <b>Release</b> methods, see the discussion of the <b>IUnknown</b> interface in the Windows SDK documentation.
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
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-unregisterendpointnotificationcallback
     */
    UnregisterEndpointNotificationCallback(pClient) {
        result := ComCall(7, this, "ptr", pClient, "HRESULT")
        return result
    }
}
