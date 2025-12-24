#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionEvents interface provides notifications of session-related events such as changes in the volume level, display name, and session state.
 * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nn-audiopolicy-iaudiosessionevents
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
     * @param {PWSTR} NewDisplayName The new display name for the session. This parameter points to a null-terminated, wide-character string containing the new display name. The string remains valid for the duration of the call.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname">IAudioSessionControl::SetDisplayName</a> in the call that changed the display name for the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-ondisplaynamechanged
     */
    OnDisplayNameChanged(NewDisplayName, EventContext) {
        NewDisplayName := NewDisplayName is String ? StrPtr(NewDisplayName) : NewDisplayName

        result := ComCall(3, this, "ptr", NewDisplayName, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The OnIconPathChanged method notifies the client that the display icon for the session has changed.
     * @param {PWSTR} NewIconPath The path for the new display icon for the session. This parameter points to a string that contains the path for the new icon. The string pointer remains valid only for the duration of the call.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath">IAudioSessionControl::SetIconPath</a> in the call that changed the display icon for the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-oniconpathchanged
     */
    OnIconPathChanged(NewIconPath, EventContext) {
        NewIconPath := NewIconPath is String ? StrPtr(NewIconPath) : NewIconPath

        result := ComCall(4, this, "ptr", NewIconPath, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The OnSimpleVolumeChanged method notifies the client that the volume level or muting state of the audio session has changed.
     * @param {Float} NewVolume The new volume level for the audio session. This parameter is a value in the range 0.0 to 1.0, where 0.0 is silence and 1.0 is full volume (no attenuation).
     * @param {BOOL} NewMute The new muting state. If <b>TRUE</b>, muting is enabled. If <b>FALSE</b>, muting is disabled.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume">ISimpleAudioVolume::SetMasterVolume</a> or <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-isimpleaudiovolume-setmute">ISimpleAudioVolume::SetMute</a> in the call that changed the volume level or muting state of the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-onsimplevolumechanged
     */
    OnSimpleVolumeChanged(NewVolume, NewMute, EventContext) {
        result := ComCall(5, this, "float", NewVolume, "int", NewMute, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The OnChannelVolumeChanged method notifies the client that the volume level of an audio channel in the session submix has changed.
     * @param {Integer} ChannelCount The channel count. This parameter specifies the number of audio channels in the session submix.
     * @param {Pointer<Float>} NewChannelVolumeArray Pointer to an array of volume levels. Each element is a value of type <b>float</b> that specifies the volume level for a particular channel. Each volume level is a value in the range 0.0 to 1.0, where 0.0 is silence and 1.0 is full volume (no attenuation). The number of elements in the array is specified by the <i>ChannelCount</i> parameter. If an audio stream contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. The array element whose index matches the channel number, contains the volume level for that channel. Assume that the array remains valid only for the duration of the call.
     * @param {Integer} ChangedChannel The number of the channel whose volume level changed. Use this value as an index into the <i>NewChannelVolumeArray</i> array. If the session submix contains <i>n</i> channels, the channels are numbered from 0 to <i>n</i>– 1. If more than one channel might have changed (for example, as a result of a call to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setallvolumes">IChannelAudioVolume::SetAllVolumes</a> method), the value of <i>ChangedChannel</i> is (<b>DWORD</b>)(–1).
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-ichannelaudiovolume-setchannelvolume">IChannelAudioVolume::SetChannelVolume</a> or <b>IChannelAudioVolume::SetAllVolumes</b> method in the call that initiated the change in volume level of the channel. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-onchannelvolumechanged
     */
    OnChannelVolumeChanged(ChannelCount, NewChannelVolumeArray, ChangedChannel, EventContext) {
        NewChannelVolumeArrayMarshal := NewChannelVolumeArray is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", ChannelCount, NewChannelVolumeArrayMarshal, NewChannelVolumeArray, "uint", ChangedChannel, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The OnGroupingParamChanged method notifies the client that the grouping parameter for the session has changed.
     * @param {Pointer<Guid>} NewGroupingParam The new grouping parameter for the session. This parameter points to a grouping-parameter GUID.
     * @param {Pointer<Guid>} EventContext The event context value. This is the same value that the caller passed to <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam">IAudioSessionControl::SetGroupingParam</a> in the call that changed the grouping parameter for the session. For more information, see Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-ongroupingparamchanged
     */
    OnGroupingParamChanged(NewGroupingParam, EventContext) {
        result := ComCall(7, this, "ptr", NewGroupingParam, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The OnStateChanged method notifies the client that the stream-activity state of the session has changed.
     * @param {Integer} NewState The new session state. The value of this parameter is one of the following <a href="https://docs.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audiosessionstate">AudioSessionState</a> enumeration values:
     * 
     * AudioSessionStateActive
     * 
     * AudioSessionStateInactive
     * 
     * AudioSessionStateExpired
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-onstatechanged
     */
    OnStateChanged(NewState) {
        result := ComCall(8, this, "int", NewState, "HRESULT")
        return result
    }

    /**
     * The OnSessionDisconnected method notifies the client that the audio session has been disconnected.
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
     * @see https://docs.microsoft.com/windows/win32/api//audiopolicy/nf-audiopolicy-iaudiosessionevents-onsessiondisconnected
     */
    OnSessionDisconnected(DisconnectReason) {
        result := ComCall(9, this, "int", DisconnectReason, "HRESULT")
        return result
    }
}
