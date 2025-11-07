#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioStreamVolume interface enables a client to control and monitor the volume levels for all of the channels in an audio stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudiostreamvolume
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioStreamVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStreamVolume
     * @type {Guid}
     */
    static IID => Guid("{93014887-242d-4068-8a15-cf5e93b90fe3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "SetChannelVolume", "GetChannelVolume", "SetAllVolumes", "GetAllVolumes"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiostreamvolume-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Float} fLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiostreamvolume-setchannelvolume
     */
    SetChannelVolume(dwIndex, fLevel) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiostreamvolume-getchannelvolume
     */
    GetChannelVolume(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * 
     * @param {Integer} dwCount 
     * @param {Pointer<Float>} pfVolumes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiostreamvolume-setallvolumes
     */
    SetAllVolumes(dwCount, pfVolumes) {
        pfVolumesMarshal := pfVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", dwCount, pfVolumesMarshal, pfVolumes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCount 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudiostreamvolume-getallvolumes
     */
    GetAllVolumes(dwCount) {
        result := ComCall(7, this, "uint", dwCount, "float*", &pfVolumes := 0, "HRESULT")
        return pfVolumes
    }
}
