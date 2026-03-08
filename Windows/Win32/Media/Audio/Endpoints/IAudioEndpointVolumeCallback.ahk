#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointVolumeCallback interface provides notifications of changes in the volume level and muting state of an audio endpoint device.
 * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointVolumeCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEndpointVolumeCallback
     * @type {Guid}
     */
    static IID => Guid("{657804fa-d6ad-4496-8a60-352752af4f89}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNotify"]

    /**
     * The OnNotify method notifies the client that the volume level or muting state of the audio endpoint device has changed.
     * @remarks
     * The <i>pNotify</i> parameter points to a structure that describes the volume change event that initiated the call to <b>OnNotify</b>. This structure contains an event-context GUID. This GUID enables a client to distinguish between a volume (or muting) change that it initiated and one that some other client initiated. When calling an <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/nn-endpointvolume-iaudioendpointvolume">IAudioEndpointVolume</a> method that changes the volume level of the stream, a client passes in a pointer to an event-context GUID that its implementation of the <b>OnNotify</b> method can recognize. The structure pointed to by <i>pNotify</i> contains this context GUID. If the client that changes the volume level supplies a <b>NULL</b> pointer value for the pointer to the event-context GUID, the value of the event-context GUID in the structure pointed to by <i>pNotify</i> is GUID_NULL.
     * 
     * The Windows 7, the system's volume user interface does not specify GUID_NULL when it changes the volume in the system.   A third-party OSD application can differentiate between master volume control changes that result from the system's volume user interface, and other volume changes such as changes from the built-in volume control handler.
     * 
     * For a code example that implements the <b>OnNotify</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/endpoint-volume-controls">Endpoint Volume Controls</a>.
     * @param {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>} pNotify Pointer to the volume-notification data. This parameter points to a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/endpointvolume/ns-endpointvolume-audio_volume_notification_data">AUDIO_VOLUME_NOTIFICATION_DATA</a>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify
     */
    OnNotify(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
