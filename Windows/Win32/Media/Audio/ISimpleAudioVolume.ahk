#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISimpleAudioVolume interface enables a client to control the master volume level of an audio session.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-isimpleaudiovolume
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class ISimpleAudioVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimpleAudioVolume
     * @type {Guid}
     */
    static IID => Guid("{87ce5498-68d6-44e5-9215-6da47ef883d8}")

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
     * The SetMasterVolume method sets the master volume level for the audio session.
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
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-isimpleaudiovolume-setmastervolume
     */
    SetMasterVolume(fLevel, EventContext) {
        result := ComCall(3, this, "float", fLevel, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The GetMasterVolume method retrieves the client volume level for the audio session.
     * @returns {Float} Pointer to a <b>float</b> variable into which the method writes the client volume level. The volume level is a value in the range 0.0 to 1.0.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-isimpleaudiovolume-getmastervolume
     */
    GetMasterVolume() {
        result := ComCall(4, this, "float*", &pfLevel := 0, "HRESULT")
        return pfLevel
    }

    /**
     * The SetMute method sets the muting state for the audio session.
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
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-isimpleaudiovolume-setmute
     */
    SetMute(bMute, EventContext) {
        result := ComCall(5, this, "int", bMute, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The GetMute method retrieves the current muting state for the audio session.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable into which the method writes the muting state. <b>TRUE</b> indicates that muting is enabled. <b>FALSE</b> indicates that it is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//audioclient/nf-audioclient-isimpleaudiovolume-getmute
     */
    GetMute() {
        result := ComCall(6, this, "int*", &pbMute := 0, "HRESULT")
        return pbMute
    }
}
