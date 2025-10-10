#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents an audio data buffer, used with IXAudio2SourceVoice::SubmitSourceBuffer.
 * @remarks
 * 
  * XAudio2 audio data is interleaved, data from each channel is adjacent for a particular sample number. For example if there was a 4 channel wave playing into an XAudio2 source voice, the audio data would be a sample of channel 0, a sample of channel 1, a sample of channel 2, a sample of channel 3, and then the next sample of channels 0, 1, 2, 3, etc.
  * 
  * 
  * 
  * The <b>AudioBytes</b> and <b>pAudioData</b> members of <b>XAUDIO2_BUFFER</b> correspond to the size in bytes and contents of the 'data' RIFF chunk of the file being played. The contents of the chunk may need to be byte swapped when loading the file on Xbox 360.
  * 
  * 
  * 
  * Memory allocated to hold a <b>XAUDIO2_BUFFER</b> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_buffer_wma">XAUDIO2_BUFFER_WMA</a> structure can be freed as soon as the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-submitsourcebuffer">IXAudio2SourceVoice::SubmitSourceBuffer</a> call it is passed to returns. The data the structure points to (<b>pAudioData</b> and <b>pDecodedPacketCumulativeBytes</b>, respectively) can't be freed until the buffer completes (as signaled by the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2voicecallback-onbufferend">IXAudio2VoiceCallback::OnBufferEnd</a> callback) or the voice is stopped or destroyed.
  * 
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xaudio2/ns-xaudio2-xaudio2_buffer
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_BUFFER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Flags that provide additional information about the audio buffer. May be 0, or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>XAUDIO2_END_OF_STREAM</td>
     * <td>Indicates that there cannot be any buffers in the queue
     *           after this buffer. The only effect of this flag is to suppress debug output warnings caused
     *           by starvation of the buffer queue. </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the audio data, in bytes. Must be no larger than XAUDIO2_MAX_BUFFER_BYTES (defined in xaudio2.h) for PCM data and no larger than XMA_READBUFFER_MAX_BYTES (defined in xma2defs.h) for XMA data.
     * 
     * <div class="alert"><b>Note</b>  XMA buffers submitted to an XAudio2 voice using <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2sourcevoice-submitsourcebuffer">IXAudio2SourceVoice::SubmitSourceBuffer</a> must contain complete XMA blocks. A complete XMA block must be equal in size to the <b>XMA2WAVEFORMATEX.BytesPerBlock</b> value, except for the last XMA block in a file, which may be shorter but will still be considered complete.</div>
     * <div> </div>
     * @type {Integer}
     */
    AudioBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the audio data.
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>
     * The memory allocated for a buffer containing XMA data must have a block alignment of 2048. This is accomplished using
     *          <b>XPhysicalAlloc</b> with the <i>ulAlignment</i> argument set to 2048.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Byte>}
     */
    pAudioData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * First sample in the buffer that should be played. 
     * 
     * 
     * For XMA buffers this value must be a multiple of 128 samples.
     * @type {Integer}
     */
    PlayBegin {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Length of the region to be played, in samples. A value of zero means to play the entire buffer, and, in this case, <i>PlayBegin</i> must be zero as well. 
     * For ADPCM data this value must be a multiple of <b>wSamplesPerBlock</b> in the <b>ADPCMWAVEFORMAT</b> structure that contains this <b>XAUDIO2_BUFFER</b> structure.
     * @type {Integer}
     */
    PlayLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * First sample of the region to be looped. The value of <i>LoopBegin</i> must be less than <i>PlayBegin</i> + <i>PlayLength</i>. <i>LoopBegin</i> can be less than <i>PlayBegin</i>. <i>LoopBegin</i> must be 0 if <i>LoopCount</i> is 0.
     * @type {Integer}
     */
    LoopBegin {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Length of the loop region, in samples. The value of <i>LoopBegin</i>+<i>LoopLength</i> must be greater than <i>PlayBegin</i> and less than <i>PlayBegin</i> + <i>PlayLength</i>. <i>LoopLength</i> must be zero if LoopCount is 0. If <i>LoopCount</i> is not 0 then a loop length of zero indicates the entire sample should be looped. 
     * For ADPCM data this value must be a multiple of <b>wSamplesPerBlock</b> in the <b>ADPCMWAVEFORMAT</b> structure that contains this <b>XAUDIO2_BUFFER</b> structure.
     * @type {Integer}
     */
    LoopLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Number of times to loop through the loop region. This value can be between 0 and XAUDIO2_MAX_LOOP_COUNT. If <i>LoopCount</i> is zero no looping is performed and <i>LoopBegin</i> and <i>LoopLength</i> must be 0. To loop forever, set <i>LoopCount</i> to XAUDIO2_LOOP_INFINITE.
     * @type {Integer}
     */
    LoopCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Context value to be passed back in callbacks to the client. This may be NULL.
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
