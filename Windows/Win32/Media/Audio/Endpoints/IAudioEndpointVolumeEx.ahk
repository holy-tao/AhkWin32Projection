#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAudioEndpointVolume.ahk

/**
 * The IAudioEndpointVolumeEx interface provides volume controls on the audio stream to or from a device endpoint.
 * @see https://docs.microsoft.com/windows/win32/api//endpointvolume/nn-endpointvolume-iaudioendpointvolumeex
 * @namespace Windows.Win32.Media.Audio.Endpoints
 * @version v4.0.30319
 */
class IAudioEndpointVolumeEx extends IAudioEndpointVolume{
    /**
     * The interface identifier for IAudioEndpointVolumeEx
     * @type {Guid}
     */
    static IID => Guid("{66e11784-f695-4f28-a505-a7080081a78f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * 
     * @param {Integer} iChannel 
     * @param {Pointer<Single>} pflVolumeMindB 
     * @param {Pointer<Single>} pflVolumeMaxdB 
     * @param {Pointer<Single>} pflVolumeIncrementdB 
     * @returns {HRESULT} 
     */
    GetVolumeRangeChannel(iChannel, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        result := ComCall(21, this, "uint", iChannel, "float*", pflVolumeMindB, "float*", pflVolumeMaxdB, "float*", pflVolumeIncrementdB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
