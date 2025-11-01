#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAudioEndpointVolumeCallback interface provides notifications of changes in the volume level and muting state of an audio endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nn-endpointvolume-iaudioendpointvolumecallback
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
     * 
     * @param {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumecallback-onnotify
     */
    OnNotify(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }
}
