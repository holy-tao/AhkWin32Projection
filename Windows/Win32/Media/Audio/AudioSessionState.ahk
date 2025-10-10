#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AudioSessionState enumeration defines constants that indicate the current state of an audio session.
 * @remarks
 * 
  * When a client opens a session by assigning the first stream to the session (by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method), the initial session state is inactive. The session state changes from inactive to active when a stream in the session begins running (because the client has called the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-start">IAudioClient::Start</a> method). The session changes from active to inactive when the client stops the last running stream in the session (by calling the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-stop">IAudioClient::Stop</a> method). The session state changes to expired when the client destroys the last stream in the session by releasing all references to the stream object.
  * 
  * The system volume-control program, Sndvol, displays volume controls for both active and inactive sessions. Sndvol stops displaying the volume control for a session when the session state changes to expired. For more information about Sndvol, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-sessions">Audio Sessions</a>.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessioncontrol-getstate">IAudioSessionControl::GetState</a> and <a href="https://docs.microsoft.com/windows/desktop/api/audiopolicy/nf-audiopolicy-iaudiosessionevents-onstatechanged">IAudioSessionEvents::OnStateChanged</a> methods use the constants defined in the <b>AudioSessionState</b> enumeration.
  * 
  * For more information about session states, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audio-sessions">Audio Sessions</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audiosessiontypes/ne-audiosessiontypes-audiosessionstate
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AudioSessionState{

    /**
     * The audio session is inactive. (It contains at least one stream, but none of the streams in the session is currently running.)
     * @type {Integer (Int32)}
     */
    static AudioSessionStateInactive => 0

    /**
     * The audio session is active. (At least one of the streams in the session is running.)
     * @type {Integer (Int32)}
     */
    static AudioSessionStateActive => 1

    /**
     * The audio session has expired. (It contains no streams.)
     * @type {Integer (Int32)}
     */
    static AudioSessionStateExpired => 2
}
