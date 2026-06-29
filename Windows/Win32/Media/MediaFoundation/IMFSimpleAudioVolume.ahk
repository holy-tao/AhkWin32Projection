#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the master volume level of the audio session associated with the streaming audio renderer (SAR) and the audio capture source.
 * @remarks
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
 * For example, if the master volume is 0.8 and the channel volume is 0.5, the attenuation for that channel is 0.8 × 0.5 = 0.4. Volume levels can exceed 1.0 (positive gain), but the audio engine clips any audio samples that exceed zero decibels. To change the volume level of individual channels, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfaudiostreamvolume">IMFAudioStreamVolume</a> interface.
 * 
 * Use the following formula to convert the volume level to the decibel (dB) scale:
 * 
 * Attenuation (dB) = 20 * log10(<i>Level</i>)
 *         
 * 
 * For example, a volume level of 0.50 represents 6.02 dB of attenuation.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsimpleaudiovolume
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSimpleAudioVolume extends IUnknown {
    /**
     * The interface identifier for IMFSimpleAudioVolume
     * @type {Guid}
     */
    static IID := Guid("{089edf13-cf71-4338-8d13-9e569dbdc319}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSimpleAudioVolume interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMasterVolume : IntPtr
        GetMasterVolume : IntPtr
        SetMute         : IntPtr
        GetMute         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSimpleAudioVolume.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the master volume level.
     * @remarks
     * Events outside of the application can change the master volume level. For example, the user can change the volume from the system volume-control program (SndVol). If an external event changes the master volume, the audio renderer sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meaudiosessionvolumechanged">MEAudioSessionVolumeChanged</a> event, which the Media Session forwards to the application.
     * @param {Float} fLevel Volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio renderer is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_STREAMSINK_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio renderer was removed from the pipeline.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-setmastervolume
     */
    SetMasterVolume(fLevel) {
        result := ComCall(3, this, "float", fLevel, "HRESULT")
        return result
    }

    /**
     * Retrieves the master volume level.
     * @remarks
     * If an external event changes the master volume, the audio renderer sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meaudiosessionvolumechanged">MEAudioSessionVolumeChanged</a> event, which the Media Session forwards to the application.
     * @returns {Float} Receives the volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-getmastervolume
     */
    GetMasterVolume() {
        result := ComCall(4, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * Mutes or unmutes the audio. (IMFSimpleAudioVolume.SetMute)
     * @remarks
     * This method does not change the volume level returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsimpleaudiovolume-getmastervolume">IMFSimpleAudioVolume::GetMasterVolume</a> function.
     * @param {BOOL} bMute Specify <b>TRUE</b> to mute the audio, or <b>FALSE</b> to unmute the audio.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio renderer is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_STREAMSINK_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio renderer was removed from the pipeline.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-setmute
     */
    SetMute(bMute) {
        result := ComCall(5, this, BOOL, bMute, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio is muted. (IMFSimpleAudioVolume.GetMute)
     * @remarks
     * Calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsimpleaudiovolume-setmastervolume">IMFSimpleAudioVolume::SetMasterVolume</a> to set the volume does not change whether the audio is muted.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, the audio is muted; otherwise, the audio is not muted.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsimpleaudiovolume-getmute
     */
    GetMute() {
        result := ComCall(6, this, BOOL.Ptr, &pbMute := 0, "HRESULT")
        return pbMute
    }

    Query(iid) {
        if (IMFSimpleAudioVolume.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMasterVolume := CallbackCreate(GetMethod(implObj, "SetMasterVolume"), flags, 2)
        this.vtbl.GetMasterVolume := CallbackCreate(GetMethod(implObj, "GetMasterVolume"), flags, 2)
        this.vtbl.SetMute := CallbackCreate(GetMethod(implObj, "SetMute"), flags, 2)
        this.vtbl.GetMute := CallbackCreate(GetMethod(implObj, "GetMute"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMasterVolume)
        CallbackFree(this.vtbl.GetMasterVolume)
        CallbackFree(this.vtbl.SetMute)
        CallbackFree(this.vtbl.GetMute)
    }
}
