#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIRECTX_AUDIO_ACTIVATION_PARAMS structure specifies the initialization parameters for a DirectSound stream.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate">IMMDevice::Activate</a> method. When activating an <b>IDirectSound</b>, <b>IDirectSoundCapture</b>, or <b>IBaseFilter</b> interface on an audio endpoint device, the <b>DIRECTX_AUDIO_ACTIVATION_PARAMS</b> structure specifies the session GUID and stream-initialization flags for the audio stream that the DirectSound module creates and encapsulates in the interface instance. During the <b>Activate</b> call, DirectSound calls the <a href="https://docs.microsoft.com/windows/desktop/api/audioclient/nf-audioclient-iaudioclient-initialize">IAudioClient::Initialize</a> method and specifies the session GUID and stream-initialization flags from the <b>DIRECTX_AUDIO_ACTIVATION_PARAMS</b> structure as input parameters.
  * 
  * For more information about <b>IDirectSound</b>, <b>IDirectSoundCapture</b>, and <b>IBaseFilter</b>, see the Windows SDK documentation.
  * 
  * For a code example that uses the <b>DIRECTX_AUDIO_ACTIVATION_PARAMS</b> structure, see <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/device-roles-for-directshow-applications">Device Roles for DirectShow Applications</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/ns-mmdeviceapi-directx_audio_activation_params
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class DIRECTX_AUDIO_ACTIVATION_PARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>DIRECTX_AUDIO_ACTIVATION_PARAMS</b> structure. Set this member to sizeof(DIRECTX_AUDIO_ACTIVATION_PARAMS).
     * @type {Integer}
     */
    cbDirectXAudioActivationParams {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Session GUID. This member is a GUID value that identifies the audio session that the stream belongs to. If the GUID identifies a session that has been previously opened, the method adds the stream to that session. If the GUID does not identify an existing session, the method opens a new session and adds the stream to that session. The stream remains a member of the same session for its lifetime.
     * @type {Pointer<Guid>}
     */
    guidAudioSession {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Stream-initialization flags. This member specifies whether the stream belongs to a cross-process session or to a session that is specific to the current process. Set this member to 0 or to the following <a href="https://docs.microsoft.com/windows/desktop/CoreAudio/audclnt-streamflags-xxx-constants">AUDCLNT_STREAMFLAGS_XXX</a> constant:
     * 
     * AUDCLNT_STREAMFLAGS_CROSSPROCESS
     * @type {Integer}
     */
    dwAudioStreamFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
