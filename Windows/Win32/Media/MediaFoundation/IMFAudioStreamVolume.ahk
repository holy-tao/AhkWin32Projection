#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the volume levels of individual audio channels.
 * @remarks
 * 
 * If your application does not require channel-level volume control, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsimpleaudiovolume">IMFSimpleAudioVolume</a> interface to control the master volume level of the audio session.
 * 
 * Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation). For each channel, the attenuation level is the product of:
 * 
 * <ul>
 * <li>The master volume level of the audio session.
 *           </li>
 * <li>The volume level of the channel.
 *           </li>
 * </ul>
 * For example, if the master volume is 0.8 and the channel volume is 0.5, the attenuation for that channel is 0.8 × 0.5 = 0.4. Volume levels can exceed 1.0 (positive gain), but the audio engine clips any audio samples that exceed zero decibels.
 * 
 * Use the following formula to convert the volume level to the decibel (dB) scale:
 * 
 * Attenuation (dB) = 20 * log10(<i>Level</i>)
 * 
 * For example, a volume level of 0.50 represents 6.02 dB of attenuation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfaudiostreamvolume
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFAudioStreamVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFAudioStreamVolume
     * @type {Guid}
     */
    static IID => Guid("{76b1bbdb-4ec8-4f36-b106-70a9316df593}")

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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-setchannelvolume
     */
    SetChannelVolume(dwIndex, fLevel) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelvolume
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-setallvolumes
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getallvolumes
     */
    GetAllVolumes(dwCount) {
        result := ComCall(7, this, "uint", dwCount, "float*", &pfVolumes := 0, "HRESULT")
        return pfVolumes
    }
}
