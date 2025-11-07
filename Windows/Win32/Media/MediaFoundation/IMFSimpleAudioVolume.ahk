#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the master volume level of the audio session associated with the streaming audio renderer (SAR) and the audio capture source.
 * @remarks
 * 
  * To control the volume levels of individual channels, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfaudiostreamvolume">IMFAudioStreamVolume</a> interface. The <b>IMFAudioStreamVolume</b>   interface is supported by the SAR only.
  * 
  * Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation). For each channel, the attenuation level is the product of:
  * 
  * <ul>
  * <li>
  * The master volume level of the audio session.
  * 
  * </li>
  * <li>
  * The volume level of the channel.
  * 
  * </li>
  * </ul>
  * For example, if the master volume is 0.8 and the channel volume is 0.5, the attenuaton for that channel is 0.8 × 0.5 = 0.4. Volume levels can exceed 1.0 (positive gain), but the audio engine clips any audio samples that exceed zero decibels. To change the volume level of individual channels, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfaudiostreamvolume">IMFAudioStreamVolume</a> interface.
  * 
  * Use the following formula to convert the volume level to the decibel (dB) scale:
  * 
  * Attenuation (dB) = 20 * log10(<i>Level</i>)
  *         
  * 
  * For example, a volume level of 0.50 represents 6.02 dB of attenuation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsimpleaudiovolume
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSimpleAudioVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSimpleAudioVolume
     * @type {Guid}
     */
    static IID => Guid("{089edf13-cf71-4338-8d13-9e569dbdc319}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMasterVolume", "GetMasterVolume", "SetMute", "GetMute"]

    /**
     * 
     * @param {Float} fLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-setmastervolume
     */
    SetMasterVolume(fLevel) {
        result := ComCall(3, this, "float", fLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-getmastervolume
     */
    GetMasterVolume() {
        result := ComCall(4, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * 
     * @param {BOOL} bMute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-setmute
     */
    SetMute(bMute) {
        result := ComCall(5, this, "int", bMute, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-getmute
     */
    GetMute() {
        result := ComCall(6, this, "int*", &pbMute := 0, "HRESULT")
        return pbMute
    }
}
