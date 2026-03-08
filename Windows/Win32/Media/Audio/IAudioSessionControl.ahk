#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioSessionControl interface enables a client to configure the control parameters for an audio session and to monitor events in the session.
 * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioSessionControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionControl
     * @type {Guid}
     */
    static IID => Guid("{f4b1a599-7266-4319-a8ca-e70acb11e8cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetState", "GetDisplayName", "SetDisplayName", "GetIconPath", "SetIconPath", "GetGroupingParam", "SetGroupingParam", "RegisterAudioSessionNotification", "UnregisterAudioSessionNotification"]

    /**
     * The GetState method retrieves the current state of the audio session.
     * @remarks
     * This method indicates whether the state of the session is active, inactive, or expired. The state is active if the session has one or more streams that are running. The state changes from active to inactive when the last running stream in the session stops. The session state changes to expired when the client destroys the last stream in the session by releasing all references to the stream object.
     * 
     * The Sndvol program displays volume and mute controls for sessions that are in the active and inactive states. When a session expires, Sndvol stops displaying the controls for that session. If a session has previously expired, but the session state changes to active (because a stream in the session begins running) or inactive (because a client assigns a new stream to the session), Sndvol resumes displaying the controls for the session.
     * 
     * The client creates a stream by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method. At the time that it creates a stream, the client assigns the stream to a session. A session begins when a client assigns the first stream to the session. Initially, the session is in the inactive state. The session state changes to active when the first stream in the session begins running. The session terminates when a client releases the final reference to the last remaining stream object in the session.
     * @returns {Integer} Pointer to a variable into which the method writes the current session state. The state must be one of the following <a href="https://docs.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audiosessionstate">AudioSessionState</a> enumeration values:
     * 
     * AudioSessionStateActive
     * 
     * AudioSessionStateInactive
     * 
     * AudioSessionStateExpired
     * 
     * These values indicate that the session state is active, inactive, or expired, respectively. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getstate
     */
    GetState() {
        result := ComCall(3, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The GetDisplayName method retrieves the display name for the audio session.
     * @remarks
     * If the client has not called <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname">IAudioSessionControl::SetDisplayName</a> to set the display name, the string will be empty. Rather than display an empty name string, the Sndvol program uses a default, automatically generated name to label the volume control for the audio session.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that contains the display name. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getdisplayname
     */
    GetDisplayName() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The SetDisplayName method assigns a display name to the current session.
     * @remarks
     * In Windows Vista, the system-supplied program, Sndvol.exe, uses the display name to label the volume control for the session. If the client does not call <b>SetDisplayName</b> to assign a display name to the session, the Sndvol program uses a default, automatically generated name to label the session. The default name incorporates information such as the window title or version resource of the audio application.
     * 
     * If a client has more than one active session, client-specified display names are especially helpful for distinguishing among the volume controls for the various sessions.
     * 
     * In the case of a cross-process session, the session has no identifying information, such as an application name or process ID, from which to generate a default display name. Thus, the client must call <b>SetDisplayName</b> to avoid displaying a meaningless default display name.
     * 
     * The display name does not persist beyond the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> object. Thus, after all references to the object are released, a subsequently created version of the object (with the same application, same session GUID, and same endpoint device) will once again have a default, automatically generated display name until the client calls <b>SetDisplayName</b>.
     * 
     * The client can retrieve the display name for the session by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getdisplayname">IAudioSessionControl::GetDisplayName</a> method.
     * @param {PWSTR} Value Pointer to a null-terminated, wide-character string that contains the display name for the session.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates a name-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>Value</i> is <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setdisplayname
     */
    SetDisplayName(Value, EventContext) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(5, this, "ptr", Value, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The GetIconPath method retrieves the path for the display icon for the audio session.
     * @remarks
     * If a client has not called <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath">IAudioSessionControl::SetIconPath</a> to set the display icon, the string will be empty. If no client-specified icon is available, the Sndvol program uses the icon from the client's application window to label the volume control for the audio session.
     * @returns {PWSTR} Pointer to a pointer variable into which the method writes the address of a null-terminated, wide-character string that specifies the fully qualified path of an .ico, .dll, or .exe file that contains the icon. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. For information about icon paths and <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-geticonpath
     */
    GetIconPath() {
        result := ComCall(6, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The SetIconPath method assigns a display icon to the current session.
     * @remarks
     * In Windows Vista, the system-supplied program, Sndvol.exe, uses the display icon (along with the display name) to label the volume control for the session. If the client does not call <b>SetIconPath</b> to assign an icon to the session, the Sndvol program uses the icon from the application window as the default icon for the session.
     * 
     * In the case of a cross-process session, the session is not associated with a single application process. Thus, Sndvol has no application-specific icon to use by default, and the client must call <b>SetIconPath</b> to avoid displaying a meaningless icon.
     * 
     * The display icon does not persist beyond the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> object. Thus, after all references to the object are released, a subsequently created version of the object (with the same application, same session GUID, and same endpoint device) will once again have a default icon until the client calls <b>SetIconPath</b>.
     * 
     * The client can retrieve the display icon for the session by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-geticonpath">IAudioSessionControl::GetIconPath</a> method.
     * @param {PWSTR} Value Pointer to a null-terminated, wide-character string that specifies the path and file name of an .ico, .dll, or .exe file that contains the icon. For information about icon paths, see the Windows SDK documentation.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates an icon-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>Value</i> is <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-seticonpath
     */
    SetIconPath(Value, EventContext) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(7, this, "ptr", Value, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The GetGroupingParam method retrieves the grouping parameter of the audio session.
     * @remarks
     * All of the audio sessions that have the same grouping parameter value are under the control of the same volume-level slider in the system volume-control program, Sndvol. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/grouping-parameters">Grouping Parameters</a>.
     * 
     * A client can call the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam">IAudioSessionControl::SetGroupingParam</a> method to change the grouping parameter of a session.
     * 
     * If a client has never called <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam">SetGroupingParam</a> to assign a grouping parameter to an audio session, the session's grouping parameter value is GUID_NULL by default and a call to <b>GetGroupingParam</b> retrieves this value. A grouping parameter value of GUID_NULL indicates that the session does not belong to any grouping. In that case, the session has its own volume-level slider in the Sndvol program.
     * @returns {Guid} Output pointer for the grouping-parameter GUID. This parameter must be a valid, non-<b>NULL</b> pointer to a caller-allocated GUID variable. The method writes the grouping parameter into this variable.
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getgroupingparam
     */
    GetGroupingParam() {
        pRetVal := Guid()
        result := ComCall(8, this, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * The SetGroupingParam method assigns a session to a grouping of sessions.
     * @remarks
     * A client calls this method to change the grouping parameter of a session. All of the audio sessions that have the same grouping parameter value are under the control of the same volume-level slider in the system volume-control program, Sndvol. For more information, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/grouping-parameters">Grouping Parameters</a>.
     * 
     * The client can get the current grouping parameter for the session by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getgroupingparam">IAudioSessionControl::GetGroupingParam</a> method.
     * 
     * If a client has never called <b>SetGroupingParam</b> to assign a grouping parameter to a session, the session does not belong to any grouping. A session that does not belong to any grouping has its own, dedicated volume-level slider in the Sndvol program.
     * @param {Pointer<Guid>} Override The new grouping parameter. This parameter must be a valid, non-<b>NULL</b> pointer to a grouping-parameter GUID. For more information, see Remarks.
     * @param {Pointer<Guid>} EventContext Pointer to the event-context GUID. If a call to this method generates a grouping-change event, the session manager sends notifications to all clients that have registered <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interfaces with the session manager. The session manager includes the <i>EventContext</i> pointer value with each notification. Upon receiving a notification, a client can determine whether it or another client is the source of the event by inspecting the <i>EventContext</i> value. This scheme depends on the client selecting a value for this parameter that is unique among all clients in the session. If the caller supplies a <b>NULL</b> pointer for this parameter, the client's notification method receives a <b>NULL</b> context pointer.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>Grouping</i> is <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-setgroupingparam
     */
    SetGroupingParam(Override, EventContext) {
        result := ComCall(9, this, "ptr", Override, "ptr", EventContext, "HRESULT")
        return result
    }

    /**
     * The RegisterAudioSessionNotification method registers the client to receive notifications of session events, including changes in the stream state.
     * @remarks
     * This method passes a client-implemented <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface to the session manager. Following a successful call to this method, the session manager calls the methods in the <b>IAudioSessionEvents</b> interface to notify the client of various session events. Through these methods, the client receives notifications of the following session-related events:
     * 
     * <ul>
     * <li>Display name changes</li>
     * <li>Volume level changes</li>
     * <li>Session state changes (inactive to active, or active to inactive)</li>
     * <li>Grouping parameter changes</li>
     * <li>Disconnection of the client from the session (caused by the user removing the audio endpoint device, shutting down the session manager, or changing the stream format)</li>
     * </ul>
     * When notifications are no longer needed, the client can call the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-unregisteraudiosessionnotification">IAudioSessionControl::UnregisterAudioSessionNotification</a> method to terminate the notifications.
     * 
     * Before the client releases its final reference to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, it should call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-unregisteraudiosessionnotification">UnregisterAudioSessionNotification</a> to unregister the interface. Otherwise, the application leaks the resources held by the <b>IAudioSessionEvents</b> and <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> objects. Note that <b>RegisterAudioSessionNotification</b> calls the client's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IAudioSessionEvents::AddRef</a> method, and <b>UnregisterAudioSessionNotification</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IAudioSessionEvents::Release</a> method. If the client errs by releasing its reference to the <b>IAudioSessionEvents</b> interface before calling <b>UnregisterAudioSessionNotification</b>, the session manager never releases its reference to the <b>IAudioSessionEvents</b> interface. For example, a poorly designed <b>IAudioSessionEvents</b> implementation might call <b>UnregisterAudioSessionNotification</b> from the destructor for the <b>IAudioSessionEvents</b> object. In this case, the client will not call <b>UnregisterAudioSessionNotification</b> until the session manager releases its reference to the <b>IAudioSessionEvents</b> interface, and the session manager will not release its reference to the <b>IAudioSessionEvents</b> interface until the client calls <b>UnregisterAudioSessionNotification</b>. For more information about the <b>AddRef</b> and <b>Release</b> methods, see the discussion of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface in the Windows SDK documentation.
     * 
     * In addition, the client should call <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-unregisteraudiosessionnotification">UnregisterAudioSessionNotification</a> before releasing all of its references to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> and <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionmanager">IAudioSessionManager</a> objects. Unless the client retains a reference to at least one of these two objects, the session manager leaks the storage that it allocated to hold the registration information. After registering a notification interface, the client continues to receive notifications for only as long as at least one of these two objects exists.
     * 
     * For a code example that calls the <b>RegisterAudioSessionNotification</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-events-for-legacy-audio-applications">Audio Events for Legacy Audio Applications</a>.
     * @param {IAudioSessionEvents} NewNotifications Pointer to a client-implemented <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface. If the method succeeds, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the client's <b>IAudioSessionEvents</b> interface.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>NewNotifications</i> is <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-registeraudiosessionnotification
     */
    RegisterAudioSessionNotification(NewNotifications) {
        result := ComCall(10, this, "ptr", NewNotifications, "HRESULT")
        return result
    }

    /**
     * The UnregisterAudioSessionNotification method deletes a previous registration by the client to receive notifications.
     * @remarks
     * The client calls this method when it no longer needs to receive notifications. The <b>UnregisterAudioSessionNotification</b> method removes the registration of an <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface that the client previously registered with the session manager by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-registeraudiosessionnotification">IAudioSessionControl::RegisterAudioSessionNotification</a> method.
     * 
     * Before the client releases its final reference to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface, it should call <b>UnregisterAudioSessionNotification</b> to unregister the interface. Otherwise, the application leaks the resources held by the <b>IAudioSessionEvents</b> and <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessioncontrol">IAudioSessionControl</a> objects. Note that <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-registeraudiosessionnotification">RegisterAudioSessionNotification</a> calls the client's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IAudioSessionEvents::AddRef</a> method, and <b>UnregisterAudioSessionNotification</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IAudioSessionEvents::Release</a> method. If the client errs by releasing its reference to the <b>IAudioSessionEvents</b> interface before calling <b>UnregisterAudioSessionNotification</b>, the session manager never releases its reference to the <b>IAudioSessionEvents</b> interface. For example, a poorly designed <b>IAudioSessionEvents</b> implementation might call <b>UnregisterAudioSessionNotification</b> from the destructor for the <b>IAudioSessionEvents</b> object. In this case, the client will not call <b>UnregisterAudioSessionNotification</b> until the session manager releases its reference to the <b>IAudioSessionEvents</b> interface, and the session manager will not release its reference to the <b>IAudioSessionEvents</b> interface until the client calls <b>UnregisterAudioSessionNotification</b>. For more information about the <b>AddRef</b> and <b>Release</b> methods, see the discussion of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface in the Windows SDK documentation.
     * 
     * For a code example that calls the <b>UnregisterAudioSessionNotification</b> method, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-events-for-legacy-audio-applications">Audio Events for Legacy Audio Applications</a>.
     * @param {IAudioSessionEvents} NewNotifications Pointer to a client-implemented <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nn-audiopolicy-iaudiosessionevents">IAudioSessionEvents</a> interface. The client passed this same interface pointer to the session manager in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-registeraudiosessionnotification">IAudioSessionControl::RegisterAudioSessionNotification</a> method. If the <b>UnregisterAudioSessionNotification</b> method succeeds, it calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method on the client's <b>IAudioSessionEvents</b> interface.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Parameter <i>NewNotifications</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified interface was not previously registered by the client or has already been removed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-unregisteraudiosessionnotification
     */
    UnregisterAudioSessionNotification(NewNotifications) {
        result := ComCall(11, this, "ptr", NewNotifications, "HRESULT")
        return result
    }
}
