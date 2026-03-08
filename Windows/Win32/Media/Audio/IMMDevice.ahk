#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDevice interface encapsulates the generic features of a multimedia device resource.
 * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdevice
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMDevice
     * @type {Guid}
     */
    static IID => Guid("{d666063f-1587-4e43-81f1-b948e807363f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "OpenPropertyStore", "GetId", "GetState"]

    /**
     * The Activate method creates a COM object with the specified interface.
     * @remarks
     * This method creates a COM object with an interface that is specified by the <i>iid</i> parameter. The method is similar to the Windows <b>CoCreateInstance</b> function, except that the caller does not supply a CLSID as a parameter. For more information about <b>CoCreateInstance</b>, see the Windows SDK documentation.
     * 
     * A client can call the <b>Activate</b> method of the <b>IMMDevice</b> interface for a particular audio endpoint device to obtain a counted reference to an interface on that device. The method can activate the following interfaces:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudiometerinformation">IAudioMeterInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionmanager">IAudioSessionManager</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionmanager2">IAudioSessionManager2</a>
     * </li>
     * <li>IBaseFilter
     *           </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-idevicetopology">IDeviceTopology</a>
     * </li>
     * <li>IDirectSound
     *           </li>
     * <li>IDirectSound8
     *           </li>
     * <li>IDirectSoundCapture
     *           </li>
     * <li>IDirectSoundCapture8
     *           </li>
     * <li>IMFTrustedOutput</li>
     * </ul>
     * To obtain the interface ID for an interface, use the <b>__uuidof</b> operator. For example, the interface ID of <b>IAudioCaptureClient</b> is defined as follows:
     * 
     * 
     * ``` syntax
     * 
     * const IID IID_IAudioClient  __uuidof(IAudioCaptureClient)
     * 
     * ```
     * 
     * For information about the <b>__uuidof</b> operator, see the Windows SDK documentation. For information about <b>IBaseFilter</b>, <b>IDirectSound</b>, <b>IDirectSound8</b>, <b>IDirectSoundCapture</b>,  <b>IDirectSoundCapture8</b>, and <b>IMFTrustedOutput</b> see the Windows SDK documentation.
     * 
     * The <i>pActivationParams</i> parameter should be <b>NULL</b> for an <b>Activate</b> call to create an <b>IAudioClient</b>, <b>IAudioEndpointVolume</b>, <b>IAudioMeterInformation</b>, <b>IAudioSessionManager</b>, or <b>IDeviceTopology</b> interface for an audio endpoint device.
     * 
     * For an <b>Activate</b> call to create an <b>IBaseFilter</b>, <b>IDirectSound</b>, <b>IDirectSound8</b>, <b>IDirectSoundCapture</b>, or <b>IDirectSoundCapture8</b> interface, the caller can, as an option, specify a non-<b>NULL</b> value for <i>pActivationParams</i>. In this case, <i>pActivationParams</i> points to a <b>PROPVARIANT</b> structure that contains stream-initialization information. Set the <b>vt</b> member of the structure to VT_BLOB. Set the <b>blob.pBlobData</b> member to point to a <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ns-mmdeviceapi-directx_audio_activation_params">DIRECTX_AUDIO_ACTIVATION_PARAMS</a> structure that contains an audio session GUID and stream-initialization flags. Set the <b>blob.cbSize</b> member to <b>sizeof</b>(<b>DIRECTX_AUDIO_ACTIVATION_PARAMS</b>). For a code example, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles-for-directshow-applications">Device Roles for DirectShow Applications</a>. For more information about <b>PROPVARIANT</b>, see the Windows SDK documentation.
     * 
     * An <b>IBaseFilter</b>, <b>IDirectSound</b>, <b>IDirectSound8</b>, <b>IDirectSoundCapture</b>, or <b>IDirectSoundCapture8</b> interface instance that is created by the <b>Activate</b> method encapsulates a stream on the audio endpoint device. During the <b>Activate</b> call, the DirectSound system module creates the stream by calling the <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ns-mmdeviceapi-directx_audio_activation_params">IAudioClient::Initialize</a> method. If <i>pActivationParams</i> is non-<b>NULL</b>, DirectSound supplies the audio session GUID and stream-initialization flags from the <b>DIRECTX_AUDIO_ACTIVATION_PARAMS</b> structure as input parameters to the <b>Initialize</b> call. If <i>pActivationParams</i> is <b>NULL</b>, DirectSound sets the <b>Initialize</b> method's <i>AudioSessionGuid</i> and <i>StreamFlags</i> parameters to their respective default values, <b>NULL</b> and 0. These values instruct the method to assign the stream to the process-specific session that is identified by the session GUID value GUID_NULL.
     * 
     * <b>Activate</b> can activate an <b>IDirectSound</b> or <b>IDirectSound8</b> interface only on a rendering endpoint device. It can activate an <b>IDirectSoundCapture</b> or <b>IDirectSoundCapture8</b> interface only on a capture endpoint device. An <b>Activate</b> call to activate an <b>IDirectSound</b> or <b>IDirectSoundCapture8</b> interface on a capture device or an <b>IDirectSoundCapture</b> or <b>IDirectSoundCapture8</b> interface on a rendering device fails and returns error code E_NOINTERFACE.
     * 
     * In Windows 7, a client can call <b>IMMDevice::Activate</b> and specify, <b>IID_IMFTrustedOutput</b>, to create an output trust authorities (OTA) object and retrieve a pointer to the object's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrustedoutput">IMFTrustedOutput</a> interface. OTAs can operate inside or outside the Media Foundation's protected media path (PMP) and send content outside the Media Foundation pipeline. If the caller is outside PMP, then the OTA may not operate in the PMP,  and the protection settings are less robust. For information about using protected objects for audio and example code, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/protected-user-mode-audio--puma-">Protected User Mode Audio (PUMA)</a>.
     * 
     * For general information about protected objects and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftrustedoutput">IMFTrustedOutput</a>, see "Protected Media Path" in  Media Foundation documentation.
     * 
     * <div class="alert"><b>Note</b>  When using the <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudioclient/nn-spatialaudioclient-ispatialaudioclient">ISpatialAudioClient</a> interfaces on an Xbox One Development Kit (XDK) title, you must first call <b>EnableSpatialAudio</b> before calling <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints">IMMDeviceEnumerator::EnumAudioEndpoints</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdefaultaudioendpoint">IMMDeviceEnumerator::GetDefaultAudioEndpoint</a>. Failure to do so will result in an E_NOINTERFACE error being returned from the call to Activate. <b>EnableSpatialAudio</b> is only available for XDK titles, and does not need to be called for Universal Windows Platform apps running on Xbox One, nor for any non-Xbox One devices.</div>
     * <div> </div>
     * For code examples that call the <b>Activate</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/rendering-a-stream">Rendering a Stream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-topologies">Device Topologies</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/using-the-ikscontrol-interface-to-access-audio-properties">Using the IKsControl Interface to Access Audio Properties</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-events-for-legacy-audio-applications">Audio Events for Legacy Audio Applications</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/render-spatial-sound-using-spatial-audio-objects">Render Spatial Sound Using Spatial Audio Objects</a>
     * </li>
     * </ul>
     * @param {Pointer<Guid>} iid The interface identifier. This parameter is a reference to a GUID that identifies the interface that the caller requests be activated. The caller will use this interface to communicate with the COM object. Set this parameter to one of the following interface identifiers:
     * 
     * IID_IAudioClient
     * 
     * IID_IAudioEndpointVolume
     * 
     * IID_IAudioMeterInformation
     * 
     * IID_IAudioSessionManager
     * 
     * IID_IAudioSessionManager2
     * 
     * IID_IBaseFilter
     * 
     * IID_IDeviceTopology
     * 
     * IID_IDirectSound
     * 
     * IID_IDirectSound8
     * 
     * IID_IDirectSoundCapture
     * 
     * IID_IDirectSoundCapture8
     * 
     * IID_IMFTrustedOutput
     * 
     * IID_ISpatialAudioClient
     * 
     * IID_ISpatialAudioMetadataClient
     * 
     * For more information, see Remarks.
     * @param {Integer} dwClsCtx The execution context in which the code that manages the newly created object will run. The caller can restrict the context by setting this parameter to the bitwise <b>OR</b> of one or more <b>CLSCTX</b> enumeration values. Alternatively, the client can avoid imposing any context restrictions by specifying CLSCTX_ALL. For more information about <b>CLSCTX</b>, see the Windows SDK documentation.
     * @param {Pointer<PROPVARIANT>} pActivationParams Set to <b>NULL</b> to activate an <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a>, <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a>, <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudiometerinformation">IAudioMeterInformation</a>, <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionmanager">IAudioSessionManager</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-idevicetopology">IDeviceTopology</a> interface on an audio endpoint device. When activating an <b>IBaseFilter</b>, <b>IDirectSound</b>, <b>IDirectSound8</b>, <b>IDirectSoundCapture</b>, or <b>IDirectSoundCapture8</b> interface on the device, the caller can specify a pointer to a <b>PROPVARIANT</b> structure that contains stream-initialization information. For more information, see Remarks.
     * @returns {Pointer<Void>} Pointer to a pointer variable into which the method writes the address of the interface specified by parameter <i>iid</i>. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>Activate</b> call fails,  <i>*ppInterface</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate
     */
    Activate(iid, dwClsCtx, pActivationParams) {
        result := ComCall(3, this, "ptr", iid, "uint", dwClsCtx, "ptr", pActivationParams, "ptr*", &ppInterface := 0, "HRESULT")
        return ppInterface
    }

    /**
     * The OpenPropertyStore method retrieves an interface to the device's property store.
     * @remarks
     * In general, the properties in the device's property store are read-only for clients that do not perform administrative, system, or service functions.
     * 
     * For code examples that call the <b>OpenPropertyStore</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-properties">Device Properties</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles-for-directsound-applications">Device Roles for DirectSound Applications</a>
     * </li>
     * </ul>
     * @param {Integer} stgmAccess The storage-access mode. This parameter specifies whether to open the property store in read mode, write mode, or read/write mode. Set this parameter to one of the following STGM constants:
     * 
     * STGM_READ
     * 
     * STGM_WRITE
     * 
     * STGM_READWRITE
     * 
     * The method permits a client running as an administrator to open a store for read-only, write-only, or read/write access. A client that is not running as an administrator is restricted to read-only access. For more information about STGM constants, see the Windows SDK documentation.
     * @returns {IPropertyStore} Pointer to a pointer variable into which the method writes the address of the <b>IPropertyStore</b> interface of the device's property store. Through this method, the caller obtains a counted reference to the interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>OpenPropertyStore</b> call fails,  <i>*ppProperties</i> is <b>NULL</b>. For more information about <b>IPropertyStore</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-openpropertystore
     */
    OpenPropertyStore(stgmAccess) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr*", &ppProperties := 0, "HRESULT")
        return IPropertyStore(ppProperties)
    }

    /**
     * The GetId method retrieves an endpoint ID string that identifies the audio endpoint device.
     * @remarks
     * The endpoint ID string obtained from this method identifies the audio endpoint device that is represented by the <b>IMMDevice</b> interface instance. A client can use the endpoint ID string to create an instance of the audio endpoint device at a later time or in a different process by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-getdevice">IMMDeviceEnumerator::GetDevice</a> method. Clients should treat the contents of the endpoint ID string as opaque. That is, clients should <i>not</i> attempt to parse the contents of the string to obtain information about the device. The reason is that the string format is undefined and might change from one implementation of the MMDevice API system module to the next.
     * 
     * For code examples that call the <b>GetId</b> method, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-properties">Device Properties</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles-for-legacy-windows-multimedia-applications">Device Roles for Legacy Windows Multimedia Applications</a>
     * </li>
     * </ul>
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string containing the endpoint device ID. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetId</b> call fails,  <i>*ppstrId is NULL.</i> For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid
     */
    GetId() {
        result := ComCall(5, this, "ptr*", &ppstrId := 0, "HRESULT")
        return ppstrId
    }

    /**
     * The GetState method retrieves the current device state.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable into which the method writes the current state of the device. The device-state value is one of the following <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-state-xxx-constants">DEVICE_STATE_XXX</a> constants:
     * 
     * DEVICE_STATE_ACTIVE
     * 
     * DEVICE_STATE_DISABLED
     * 
     * DEVICE_STATE_NOTPRESENT
     * 
     * DEVICE_STATE_UNPLUGGED
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getstate
     */
    GetState() {
        result := ComCall(6, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }
}
