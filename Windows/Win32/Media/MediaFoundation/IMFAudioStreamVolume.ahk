#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the volume levels of individual audio channels.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfaudiostreamvolume
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFAudioStreamVolume extends IUnknown {
    /**
     * The interface identifier for IMFAudioStreamVolume
     * @type {Guid}
     */
    static IID := Guid("{76b1bbdb-4ec8-4f36-b106-70a9316df593}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFAudioStreamVolume interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetChannelCount  : IntPtr
        SetChannelVolume : IntPtr
        GetChannelVolume : IntPtr
        SetAllVolumes    : IntPtr
        GetAllVolumes    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFAudioStreamVolume.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the number of channels in the audio stream.
     * @returns {Integer} Receives the number of channels in the audio stream.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Sets the volume level for a specified channel in the audio stream.
     * @param {Integer} dwIndex Zero-based index of the audio channel. To get the number of channels, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount">IMFAudioStreamVolume::GetChannelCount</a>.
     * @param {Float} fLevel Volume level for the channel.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-setchannelvolume
     */
    SetChannelVolume(dwIndex, fLevel) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, "HRESULT")
        return result
    }

    /**
     * Retrieves the volume level for a specified channel in the audio stream.
     * @param {Integer} dwIndex Zero-based index of the audio channel. To get the number of channels, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount">IMFAudioStreamVolume::GetChannelCount</a>.
     * @returns {Float} Receives the volume level for the channel.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelvolume
     */
    GetChannelVolume(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * Sets the individual volume levels for all of the channels in the audio stream.
     * @param {Integer} dwCount Number of elements in the <i>pfVolumes</i> array. The value must equal the number of channels. To get the number of channels, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount">IMFAudioStreamVolume::GetChannelCount</a>.
     * @param {Pointer<Float>} pfVolumes Address of an array of size <i>dwCount</i>, allocated by the caller. The array specifies the volume levels for all of the channels. Before calling the method, set each element of the array to the desired volume level for the channel.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-setallvolumes
     */
    SetAllVolumes(dwCount, pfVolumes) {
        pfVolumesMarshal := pfVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", dwCount, pfVolumesMarshal, pfVolumes, "HRESULT")
        return result
    }

    /**
     * Retrieves the volume levels for all of the channels in the audio stream.
     * @param {Integer} dwCount Number of elements in the <i>pfVolumes</i> array. The value must equal the number of channels. To get the number of channels, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfaudiostreamvolume-getchannelcount">IMFAudioStreamVolume::GetChannelCount</a>.
     * @returns {Float} Address of an array of size <i>dwCount</i>, allocated by the caller. The method fills the array with the volume level for each channel in the stream.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfaudiostreamvolume-getallvolumes
     */
    GetAllVolumes(dwCount) {
        result := ComCall(7, this, "uint", dwCount, "float*", &pfVolumes := 0, "HRESULT")
        return pfVolumes
    }

    Query(iid) {
        if (IMFAudioStreamVolume.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChannelCount := CallbackCreate(GetMethod(implObj, "GetChannelCount"), flags, 2)
        this.vtbl.SetChannelVolume := CallbackCreate(GetMethod(implObj, "SetChannelVolume"), flags, 3)
        this.vtbl.GetChannelVolume := CallbackCreate(GetMethod(implObj, "GetChannelVolume"), flags, 3)
        this.vtbl.SetAllVolumes := CallbackCreate(GetMethod(implObj, "SetAllVolumes"), flags, 3)
        this.vtbl.GetAllVolumes := CallbackCreate(GetMethod(implObj, "GetAllVolumes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetChannelCount)
        CallbackFree(this.vtbl.SetChannelVolume)
        CallbackFree(this.vtbl.GetChannelVolume)
        CallbackFree(this.vtbl.SetAllVolumes)
        CallbackFree(this.vtbl.GetAllVolumes)
    }
}
