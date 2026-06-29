#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IXAudio2Voice.ahk" { IXAudio2Voice }

/**
 * Defines a destination voice that is the target of a send from another voice and specifies whether a filter should be used.
 * @remarks
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_send_descriptor
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct XAUDIO2_SEND_DESCRIPTOR {
    #StructPack 8

    /**
     * Indicates whether a filter should be used on data sent to the voice pointed to by <b>pOutputVoice</b>. Flags can be 0 or XAUDIO2_SEND_USEFILTER.
     */
    Flags : UInt32

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nn-xaudio2-ixaudio2voice">IXAudio2Voice</a> that will be the target of the send. The <b>pOutputVoice</b> member cannot be NULL.
     */
    pOutputVoice : IXAudio2Voice

}
