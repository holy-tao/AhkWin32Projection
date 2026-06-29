#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IChannelAudioVolume interface enables a client to control and monitor the volume levels for all of the channels in the audio session that the stream belongs to.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-ichannelaudiovolume
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IChannelAudioVolume extends IUnknown {
    /**
     * The interface identifier for IChannelAudioVolume
     * @type {Guid}
     */
    static IID := Guid("{1c158861-b533-4b30-b1cf-e853e51c59b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChannelAudioVolume interfaces
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
            this.vtbl := IChannelAudioVolume.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetChannelCount method retrieves the number of channels in the stream format for the audio session.
     * @remarks
     * Call this method to get the number of channels in the audio session before calling any of the other methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-ichannelaudiovolume">IChannelAudioVolume</a> interface.
     * @returns {Integer} Pointer to a <b>UINT32</b> variable into which the method writes the channel count.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelcount
     */
    GetChannelCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The SetChannelVolume method sets the volume level for the specified channel in the audio session.
     * @remarks
     * This method, if it succeeds, generates a channel-volume-change event regardless of whether the new channel volume level differs in value from the previous channel volume level.
     * @param {Integer} dwIndex The channel number. If the stream format for the audio session has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelcount">IChannelAudioVolume::GetChannelCount</a> method.
     * @param {Float} fLevel The volume level for the channel. Valid volume levels are in the range 0.0 to 1.0.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates a channel-volume-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>dwIndex</i> is set to an invalid channel number, or parameter <i>fLevel</i> is not in the range 0.0 to 1.0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-setchannelvolume
     */
    SetChannelVolume(dwIndex, fLevel, EventContext) {
        result := ComCall(4, this, "uint", dwIndex, "float", fLevel, Guid.Ptr, EventContext, "HRESULT")
        return result
    }

    /**
     * The GetChannelVolume method retrieves the volume level for the specified channel in the audio session.
     * @remarks
     * Clients can call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setallvolumes">IChannelAudioVolume::SetAllVolumes</a> or <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setchannelvolume">IChannelAudioVolume::SetChannelVolume</a> method to set the per-channel volume levels in an audio session.
     * @param {Integer} dwIndex The channel number. If the stream format for the audio session has <i>N</i> channels, then the channels are numbered from 0 to <i>N</i>– 1. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelcount">IChannelAudioVolume::GetChannelCount</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the volume level of the specified channel. The volume level is in the range 0.0 to 1.0.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelvolume
     */
    GetChannelVolume(dwIndex) {
        result := ComCall(5, this, "uint", dwIndex, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * The SetAllVolumes method sets the individual volume levels for all the channels in the audio session.
     * @remarks
     * This method, if it succeeds, generates a channel-volume-change event regardless of whether any of the new channel volume levels differ in value from the previous channel volume levels.
     * @param {Integer} dwCount The number of elements in the <i>pfVolumes</i> array. This parameter must equal the number of channels in the stream format for the audio session. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelcount">IChannelAudioVolume::GetChannelCount</a> method.
     * @param {Pointer<Float>} pfVolumes Pointer to an array of volume levels for the channels in the audio session. The number of elements in the <i>pfVolumes</i> array is specified by the <i>dwCount</i> parameter. The caller writes the volume level for each channel to the array element whose index matches the channel number. If the stream format for the audio session has <i>N</i> channels, the channels are numbered from 0 to <i>N</i>– 1. Valid volume levels are in the range 0.0 to 1.0.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates a channel-volume-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>dwCount</i> does not equal the number of channels in the stream format for the audio session, or the value of a <i>pfVolumes</i> array element is not in the range 0.0 to 1.0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>pfVolumes</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_DEVICE_INVALIDATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio endpoint device has been unplugged, or the audio hardware or associated hardware resources have been reconfigured, disabled, removed, or otherwise made unavailable for use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>AUDCLNT_E_SERVICE_NOT_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Windows audio service is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-setallvolumes
     */
    SetAllVolumes(dwCount, pfVolumes, EventContext) {
        pfVolumesMarshal := pfVolumes is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", dwCount, pfVolumesMarshal, pfVolumes, Guid.Ptr, EventContext, "HRESULT")
        return result
    }

    /**
     * The GetAllVolumes method retrieves the volume levels for all the channels in the audio session.
     * @remarks
     * Clients can call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setallvolumes">IChannelAudioVolume::SetAllVolumes</a> or <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setchannelvolume">IChannelAudioVolume::SetChannelVolume</a> method to set the per-channel volume levels in an audio session.
     * @param {Integer} dwCount The number of elements in the <i>pfVolumes</i> array. The <i>dwCount</i> parameter must equal the number of channels in the stream format for the audio session. To get the number of channels, call the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-getchannelcount">IChannelAudioVolume::GetChannelCount</a> method.
     * @returns {Float} Pointer to an array of volume levels for the channels in the audio session. This parameter points to a caller-allocated <b>float</b> array into which the method writes the volume levels for the individual channels. Volume levels are in the range 0.0 to 1.0.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-ichannelaudiovolume-getallvolumes
     */
    GetAllVolumes(dwCount) {
        result := ComCall(7, this, "uint", dwCount, "float*", &pfVolumes := 0, "HRESULT")
        return pfVolumes
    }

    Query(iid) {
        if (IChannelAudioVolume.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetChannelCount := CallbackCreate(GetMethod(implObj, "GetChannelCount"), flags, 2)
        this.vtbl.SetChannelVolume := CallbackCreate(GetMethod(implObj, "SetChannelVolume"), flags, 4)
        this.vtbl.GetChannelVolume := CallbackCreate(GetMethod(implObj, "GetChannelVolume"), flags, 3)
        this.vtbl.SetAllVolumes := CallbackCreate(GetMethod(implObj, "SetAllVolumes"), flags, 4)
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
