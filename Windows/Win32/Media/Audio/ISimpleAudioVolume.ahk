#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISimpleAudioVolume interface enables a client to control the master volume level of an audio session.
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/nn-audioclient-isimpleaudiovolume
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ISimpleAudioVolume extends IUnknown {
    /**
     * The interface identifier for ISimpleAudioVolume
     * @type {Guid}
     */
    static IID := Guid("{87ce5498-68d6-44e5-9215-6da47ef883d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimpleAudioVolume interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMasterVolume : IntPtr
        GetMasterVolume : IntPtr
        SetMute         : IntPtr
        GetMute         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimpleAudioVolume.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetMasterVolume method sets the master volume level for the audio session.
     * @remarks
     * This method generates a volume-change event only if the method call changes the volume level of the session. For example, if the volume level is 0.4 when the call occurs, and the call sets the volume level to 0.4, no event is generated.
     * @param {Float} fLevel The new master volume level. Valid volume levels are in the range 0.0 to 1.0.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates a volume-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * Parameter <i>fLevel</i> is not in the range 0.0 to 1.0.
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
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume
     */
    SetMasterVolume(fLevel, EventContext) {
        result := ComCall(3, this, "float", fLevel, Guid.Ptr, EventContext, "HRESULT")
        return result
    }

    /**
     * The GetMasterVolume method retrieves the client volume level for the audio session.
     * @remarks
     * This method retrieves the client volume level for the session. This is the volume level that the client set in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume">ISimpleAudioVolume::SetMasterVolume</a> method.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the client volume level. The volume level is a value in the range 0.0 to 1.0.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-getmastervolume
     */
    GetMasterVolume() {
        result := ComCall(4, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * The SetMute method sets the muting state for the audio session.
     * @remarks
     * This method generates a volume-change event only if the method call changes the muting state of the session from disabled to enabled, or from enabled to disabled. For example, if muting is enabled when the call occurs, and the call enables muting, no event is generated.
     * 
     * This method applies the same muting state to all channels in the audio session. The endpoint device always applies muting uniformly across all the channels in the session. There are no <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-ichannelaudiovolume">IChannelAudioVolume</a> methods for setting the muting states of individual channels.
     * 
     * The client can get the muting state of the audio session by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-getmute">SimpleAudioVolume::GetMute</a> method.
     * @param {BOOL} bMute The new muting state. <b>TRUE</b> enables muting. <b>FALSE</b> disables muting.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates a volume-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-setmute
     */
    SetMute(bMute, EventContext) {
        result := ComCall(5, this, BOOL, bMute, Guid.Ptr, EventContext, "HRESULT")
        return result
    }

    /**
     * The GetMute method retrieves the current muting state for the audio session.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the muting state. <b>TRUE</b> indicates that muting is enabled. <b>FALSE</b> indicates that it is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-isimpleaudiovolume-getmute
     */
    GetMute() {
        result := ComCall(6, this, BOOL.Ptr, &pbMute := 0, "HRESULT")
        return pbMute
    }

    Query(iid) {
        if (ISimpleAudioVolume.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMasterVolume := CallbackCreate(GetMethod(implObj, "SetMasterVolume"), flags, 3)
        this.vtbl.GetMasterVolume := CallbackCreate(GetMethod(implObj, "GetMasterVolume"), flags, 2)
        this.vtbl.SetMute := CallbackCreate(GetMethod(implObj, "SetMute"), flags, 3)
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
