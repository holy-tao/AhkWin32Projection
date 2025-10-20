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
     * 
     * @param {Pointer<AUDIO_VOLUME_NOTIFICATION_DATA>} pNotify 
     * @returns {HRESULT} 
     */
    OnNotify(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
