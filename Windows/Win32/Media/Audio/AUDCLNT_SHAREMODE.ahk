#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AUDCLNT_SHAREMODE enumeration defines constants that indicate whether an audio stream will run in shared mode or in exclusive mode.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-isformatsupported">IAudioClient::IsFormatSupported</a> methods use the constants defined in the <b>AUDCLNT_SHAREMODE</b> enumeration.
  * 
  * In shared mode, the client can share the audio endpoint device with clients that run in other user-mode processes. The audio engine always supports formats for client streams that match the engine's mix format. In addition, the audio engine might support another format if the Windows audio service can insert system effects into the client stream to convert the client format to the mix format.
  * 
  * In exclusive mode, the Windows audio service attempts to establish a connection in which the client has exclusive access to the audio endpoint device. In this mode, the audio engine inserts no system effects into the local stream to aid in the creation of the connection point. Either the audio device can handle the specified format directly or the method fails.
  * 
  * For more information about shared-mode and exclusive-mode streams, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/user-mode-audio-components">User-Mode Audio Components</a>.
  * 
  * Starting with Xbox May 2021 Update, you can open an audio client in exclusive mode on Xbox.
 * @see https://learn.microsoft.com/windows/win32/api/audiosessiontypes/ne-audiosessiontypes-audclnt_sharemode
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDCLNT_SHAREMODE{

    /**
     * The audio stream will run in shared mode. For more information, see Remarks.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_SHAREMODE_SHARED => 0

    /**
     * The audio stream will run in exclusive mode. For more information, see Remarks.
     * @type {Integer (Int32)}
     */
    static AUDCLNT_SHAREMODE_EXCLUSIVE => 1
}
