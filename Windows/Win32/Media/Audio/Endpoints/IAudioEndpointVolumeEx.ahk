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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVolumeRangeChannel"]

    /**
     * 
     * @param {Integer} iChannel 
     * @param {Pointer<Float>} pflVolumeMindB 
     * @param {Pointer<Float>} pflVolumeMaxdB 
     * @param {Pointer<Float>} pflVolumeIncrementdB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/endpointvolume/nf-endpointvolume-iaudioendpointvolumeex-getvolumerangechannel
     */
    GetVolumeRangeChannel(iChannel, pflVolumeMindB, pflVolumeMaxdB, pflVolumeIncrementdB) {
        pflVolumeMindBMarshal := pflVolumeMindB is VarRef ? "float*" : "ptr"
        pflVolumeMaxdBMarshal := pflVolumeMaxdB is VarRef ? "float*" : "ptr"
        pflVolumeIncrementdBMarshal := pflVolumeIncrementdB is VarRef ? "float*" : "ptr"

        result := ComCall(21, this, "uint", iChannel, pflVolumeMindBMarshal, pflVolumeMindB, pflVolumeMaxdBMarshal, pflVolumeMaxdB, pflVolumeIncrementdBMarshal, pflVolumeIncrementdB, "HRESULT")
        return result
    }
}
