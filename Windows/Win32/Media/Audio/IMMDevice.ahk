#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDevice interface encapsulates the generic features of a multimedia device resource.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdevice
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
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdevice-activate
     */
    Activate(iid, dwClsCtx, pActivationParams) {
        result := ComCall(3, this, "ptr", iid, "uint", dwClsCtx, "ptr", pActivationParams, "ptr*", &ppInterface := 0, "HRESULT")
        return ppInterface
    }

    /**
     * The OpenPropertyStore method retrieves an interface to the device's property store.
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
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdevice-openpropertystore
     */
    OpenPropertyStore(stgmAccess) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr*", &ppProperties := 0, "HRESULT")
        return IPropertyStore(ppProperties)
    }

    /**
     * The GetId method retrieves an endpoint ID string that identifies the audio endpoint device.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string containing the endpoint device ID. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetId</b> call fails,  <i>*ppstrId is NULL.</i> For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdevice-getid
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
     * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nf-mmdeviceapi-immdevice-getstate
     */
    GetState() {
        result := ComCall(6, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }
}
