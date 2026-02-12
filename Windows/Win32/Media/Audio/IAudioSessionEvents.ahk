#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionEvents interface provides notifications of session-related events such as changes in the volume level, display name, and session state.
 * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nn-audiopolicy-iaudiosessionevents
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionEvents
     * @type {Guid}
     */
    static IID => Guid("{24918acc-64b3-37c1-8ca9-74a66e9957a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDisplayNameChanged", "OnIconPathChanged", "OnSimpleVolumeChanged", "OnChannelVolumeChanged", "OnGroupingParamChanged", "OnStateChanged", "OnSessionDisconnected"]

    /**
     * The OnDisplayNameChanged method notifies the client that the display name for the session has changed.
     * @remarks
     * The session manager calls this method each time a call to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname">IAudioSessionControl::SetDisplayName</a> method changes the display name of the session. The Sndvol program uses a session's display name to label the volume slider for the session.
     * 
     * The <i>EventContext</i> parameter provides a means for a client to distinguish between a display-name change that it initiated and one that some other client initiated. When calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname">IAudioSessionControl::SetDisplayName</a> method, a client passes in an <i>EventContext</i> parameter value that its implementation of the <b>OnDisplayNameChanged</b> method can recognize.
     * 
     * For a code example that implements the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {PWSTR} NewDisplayName The new display name for the session. This parameter points to a null-terminated, wide-character string containing the new display name. The string remains valid for the duration of the call.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname">IAudioSessionControl::SetDisplayName</a> in the call that changed the display name for the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-ondisplaynamechanged
     */
    OnDisplayNameChanged(NewDisplayName, EventContext) {
        NewDisplayName := NewDisplayName is String ? StrPtr(NewDisplayName) : NewDisplayName

        result := ComCall(3, this, "ptr", NewDisplayName, "ptr", EventContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnIconPathChanged method notifies the client that the display icon for the session has changed.
     * @remarks
     * The session manager calls this method each time a call to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath">IAudioSessionControl::SetIconPath</a> method changes the display icon for the session. The Sndvol program uses a session's display icon to label the volume slider for the session.
     * 
     * The <i>EventContext</i> parameter provides a means for a client to distinguish between a display-icon change that it initiated and one that some other client initiated. When calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath">IAudioSessionControl::SetIconPath</a> method, a client passes in an <i>EventContext</i> parameter value that its implementation of the <b>OnIconPathChanged</b> method can recognize.
     * 
     * For a code example that implements the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {PWSTR} NewIconPath The path for the new display icon for the session. This parameter points to a string that contains the path for the new icon. The string pointer remains valid only for the duration of the call.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath">IAudioSessionControl::SetIconPath</a> in the call that changed the display icon for the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-oniconpathchanged
     */
    OnIconPathChanged(NewIconPath, EventContext) {
        NewIconPath := NewIconPath is String ? StrPtr(NewIconPath) : NewIconPath

        result := ComCall(4, this, "ptr", NewIconPath, "ptr", EventContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnSimpleVolumeChanged method notifies the client that the volume level or muting state of the audio session has changed.
     * @remarks
     * The session manager calls this method each time a call to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume">ISimpleAudioVolume::SetMasterVolume</a> or <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmute">ISimpleAudioVolume::SetMute</a> method changes the volume level or muting state of the session.
     * 
     * The <i>EventContext</i> parameter provides a means for a client to distinguish between a volume or mute change that it initiated and one that some other client initiated. When calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume">ISimpleAudioVolume::SetMasterVolume</a> or <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmute">ISimpleAudioVolume::SetMute</a> method, a client passes in an <i>EventContext</i> parameter value that its implementation of the <b>OnSimpleVolumeChanged</b> method can recognize.
     * 
     * For a code example that implements the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {Float} NewVolume The new volume level for the audio session. This parameter is a value in the range 0.0 to 1.0, where 0.0 is silence and 1.0 is full volume (no attenuation).
     * @param {BOOL} NewMute The new muting state. If <b>TRUE</b>, muting is enabled. If <b>FALSE</b>, muting is disabled.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume">ISimpleAudioVolume::SetMasterVolume</a> or <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmute">ISimpleAudioVolume::SetMute</a> in the call that changed the volume level or muting state of the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-onsimplevolumechanged
     */
    OnSimpleVolumeChanged(NewVolume, NewMute, EventContext) {
        result := ComCall(5, this, "float", NewVolume, "int", NewMute, "ptr", EventContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnChannelVolumeChanged method notifies the client that the volume level of an audio channel in the session submix has changed.
     * @remarks
     * The session manager calls this method each time a call to the <b>IChannelAudioVolume::SetChannelVolume</b> or <b>IChannelAudioVolume::SetAllVolumes</b> method successfully updates the volume level of one or more channels in the session submix. Note that the <b>OnChannelVolumeChanged</b> call occurs regardless of whether the new channel volume level or levels differ in value from the previous channel volume level or levels.
     * 
     * The <i>EventContext</i> parameter provides a means for a client to distinguish between a channel-volume change that it initiated and one that some other client initiated. When calling the <b>IChannelAudioVolume::SetChannelVolume</b> or <b>IChannelAudioVolume::SetAllVolumes</b> method, a client passes in an <i>EventContext</i> parameter value that its implementation of the <b>OnChannelVolumeChanged</b> method can recognize.
     * 
     * For a code example that implements the methods in the <b>IAudioSessionEvents</b> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {Integer} ChannelCount The channel count. This parameter specifies the number of audio channels in the session submix.
     * @param {Pointer<Float>} NewChannelVolumeArray Pointer to an array of volume levels. Each element is a value of type <b>float</b> that specifies the volume level for a particular channel. Each volume level is a value in the range 0.0 to 1.0, where 0.0 is silence and 1.0 is full volume (no attenuation). The number of elements in the array is specified by the <i>ChannelCount</i> parameter. If an audio stream contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. The array element whose index matches the channel number, contains the volume level for that channel. Assume that the array remains valid only for the duration of the call.
     * @param {Integer} ChangedChannel The number of the channel whose volume level changed. Use this value as an index into the <i>NewChannelVolumeArray</i> array. If the session submix contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. If more than one channel might have changed (for example, as a result of a call to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setallvolumes">IChannelAudioVolume::SetAllVolumes</a> method), the value of <i>ChangedChannel</i> is (<b>DWORD</b>)(–1).
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setchannelvolume">IChannelAudioVolume::SetChannelVolume</a> or <b>IChannelAudioVolume::SetAllVolumes</b> method in the call that initiated the change in volume level of the channel. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-onchannelvolumechanged
     */
    OnChannelVolumeChanged(ChannelCount, NewChannelVolumeArray, ChangedChannel, EventContext) {
        NewChannelVolumeArrayMarshal := NewChannelVolumeArray is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", ChannelCount, NewChannelVolumeArrayMarshal, NewChannelVolumeArray, "uint", ChangedChannel, "ptr", EventContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnGroupingParamChanged method notifies the client that the grouping parameter for the session has changed.
     * @remarks
     * The session manager calls this method each time a call to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam">IAudioSessionControl::SetGroupingParam</a> method changes the grouping parameter for the session.
     * 
     * The <i>EventContext</i> parameter provides a means for a client to distinguish between a grouping-parameter change that it initiated and one that some other client initiated. When calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam">IAudioSessionControl::SetGroupingParam</a> method, a client passes in an <i>EventContext</i> parameter value that its implementation of the <b>OnGroupingParamChanged</b> method can recognize.
     * 
     * For a code example that implements the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {Pointer<Guid>} NewGroupingParam The new grouping parameter for the session. This parameter points to a grouping-parameter GUID.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam">IAudioSessionControl::SetGroupingParam</a> in the call that changed the grouping parameter for the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-ongroupingparamchanged
     */
    OnGroupingParamChanged(NewGroupingParam, EventContext) {
        result := ComCall(7, this, "ptr", NewGroupingParam, "ptr", EventContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnStateChanged method notifies the client that the stream-activity state of the session has changed.
     * @remarks
     * A client cannot generate a session-state-change event. The system is always the source of this type of event. Thus, unlike some other <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> methods, this method does not supply a context parameter.
     * 
     * The system changes the state of a session from inactive to active at the time that a client opens the first stream in the session. A client opens a stream by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method. The system changes the session state from active to inactive at the time that a client closes the last stream in the session. The client that releases the last reference to an <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> object closes the stream that is associated with the object.
     * 
     * For a code example that implements the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {Integer} NewState The new session state. The value of this parameter is one of the following <a href="https://docs.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audiosessionstate">AudioSessionState</a> enumeration values:
     * 
     * AudioSessionStateActive
     * 
     * AudioSessionStateInactive
     * 
     * AudioSessionStateExpired
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-onstatechanged
     */
    OnStateChanged(NewState) {
        result := ComCall(8, this, "int", NewState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The OnSessionDisconnected method notifies the client that the audio session has been disconnected.
     * @remarks
     * When disconnecting a session, the session manager closes the streams that belong to that session and invalidates all outstanding requests for services on those streams. The client should respond to a disconnection by releasing all of its references to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nn-audioclient-iaudioclient">IAudioClient</a> interface for a closed stream and releasing all references to the service interfaces that it obtained previously through calls to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getservice">IAudioClient::GetService</a> method.
     * 
     * Following disconnection, many of the methods in the WASAPI interfaces that are tied to closed streams in the disconnected session return error code AUDCLNT_E_DEVICE_INVALIDATED (for example, see <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getcurrentpadding">IAudioClient::GetCurrentPadding</a>). For information about recovering from this error, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/recovering-from-an-invalid-device-error">Recovering from an Invalid-Device Error</a>.
     * 
     * If the Windows audio service terminates unexpectedly, it does not have an opportunity to notify clients that it is shutting down. In that case, clients learn that the service has stopped when they call a method such as <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-getcurrentpadding">IAudioClient::GetCurrentPadding</a> that discovers that the service is no longer running and fails with error code AUDCLNT_E_SERVICE_NOT_RUNNING.
     * 
     * A client cannot generate a session-disconnected event. The system is always the source of this type of event. Thus, unlike some other <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> methods, this method does not have a context parameter.
     * 
     * For a code example that implements the methods in the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-session-events">Audio Session Events</a>.
     * @param {Integer} DisconnectReason The reason that the audio session was disconnected. The caller sets this parameter to one of the <b>AudioSessionDisconnectReason</b> enumeration values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>DisconnectReasonDeviceRemoval</td>
     * <td>The user removed the audio endpoint device.</td>
     * </tr>
     * <tr>
     * <td>DisconnectReasonServerShutdown</td>
     * <td>The Windows audio service has stopped.</td>
     * </tr>
     * <tr>
     * <td>DisconnectReasonFormatChanged</td>
     * <td>The stream format changed for the device that the audio session is connected to.</td>
     * </tr>
     * <tr>
     * <td>DisconnectReasonSessionLogoff</td>
     * <td>The user logged off the Windows Terminal Services (WTS) session that the audio session was running in.</td>
     * </tr>
     * <tr>
     * <td>DisconnectReasonSessionDisconnected</td>
     * <td>The WTS session that the audio session was running in was disconnected.</td>
     * </tr>
     * <tr>
     * <td>DisconnectReasonExclusiveModeOverride</td>
     * <td>The (shared-mode) audio session was disconnected to make the audio endpoint device available for an exclusive-mode connection.</td>
     * </tr>
     * </table>
     *  
     * 
     * For more information about WTS sessions, see the Windows SDK documentation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/audiopolicy/nf-audiopolicy-iaudiosessionevents-onsessiondisconnected
     */
    OnSessionDisconnected(DisconnectReason) {
        result := ComCall(9, this, "int", DisconnectReason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
