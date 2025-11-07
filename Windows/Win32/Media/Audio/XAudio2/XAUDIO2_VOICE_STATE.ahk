#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Returns the voice's current state and cursor position data.
 * @remarks
 * 
 * For all encoded formats, including constant bit rate (CBR) formats such as adaptive differential pulse code modulation (ADPCM), <b>SamplesPlayed</b> is expressed in terms of decoded samples. For pulse code modulation (PCM) formats, <b>SamplesPlayed</b> is expressed in terms of either input or output samples. There is a one-to-one mapping from input to output for PCM formats.
 * 
 * 
 * 
 * If a client needs to get the correlated positions of several voices—that is, to know exactly which sample of a particular voice is playing when a specified sample of another voice is playing—it must make the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-getstate">IXAudio2SourceVoice::GetState</a> calls in an XAudio2 engine callback. Doing this ensures that none of the voices advance while the calls are made.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/ns-xaudio2-xaudio2_voice_state
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_VOICE_STATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a buffer context provided in the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer">XAUDIO2_BUFFER</a> that is processed currently, or, if the voice is stopped currently, to the next buffer due to be processed. <b>pCurrentBufferContext</b> is NULL if there are no buffers in the queue.
     * @type {Pointer<Void>}
     */
    pCurrentBufferContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of audio buffers currently queued on the voice, including the one that is processed currently.
     * @type {Integer}
     */
    BuffersQueued {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Total number of samples processed by this voice since it last started, or since the last audio stream ended (as marked with the XAUDIO2_END_OF_STREAM flag). This total includes samples played multiple times due to looping. Theoretically, if all audio emitted by the voice up to this time is captured, this parameter would be the length of the audio stream in samples. If you specify <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b> when you call <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-getstate">IXAudio2SourceVoice::GetState</a>, this member won't be calculated, and its value is unspecified on return from <b>IXAudio2SourceVoice::GetState</b>. <b>IXAudio2SourceVoice::GetState</b> takes about one-third as much time to complete when you specify <b>XAUDIO2_VOICE_NOSAMPLESPLAYED</b>.
     * @type {Integer}
     */
    SamplesPlayed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
