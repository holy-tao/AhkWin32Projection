#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the creation flags, input channels, and sample rate of a voice.
 * @remarks
 * Note the DirectX SDK versions of XAUDIO2 do not support the <b>ActiveFlags</b> member.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_voice_details
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct XAUDIO2_VOICE_DETAILS {
    #StructPack 4

    /**
     * Flags used to create the voice; see the individual voice <a href="https://docs.microsoft.com/windows/desktop/xaudio2/interfaces">interfaces</a> for more information.
     */
    CreationFlags : UInt32

    /**
     * Flags that are currently set on the voice.
     */
    ActiveFlags : UInt32

    /**
     * The number of input channels the voice expects.
     */
    InputChannels : UInt32

    /**
     * The input sample rate the voice expects.
     */
    InputSampleRate : UInt32

}
