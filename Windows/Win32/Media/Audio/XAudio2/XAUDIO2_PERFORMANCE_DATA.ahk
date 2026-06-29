#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains performance information. (XAUDIO2_PERFORMANCE_DATA)
 * @remarks
 * CPU cycles are recorded using . Use to convert these values.
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_performance_data
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct XAUDIO2_PERFORMANCE_DATA {
    #StructPack 8

    /**
     * CPU cycles spent on audio processing since the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-startengine">IXAudio2::StartEngine</a> or <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/nf-xaudio2-ixaudio2-getperformancedata">IXAudio2::GetPerformanceData</a> function.
     */
    AudioCyclesSinceLastQuery : Int64

    /**
     * Total CPU cycles elapsed since the last call. 
     * 
     * <div class="alert"><b>Note</b>  This only counts cycles on the CPU on which XAudio2 is running.</div>
     * <div> </div>
     */
    TotalCyclesSinceLastQuery : Int64

    /**
     * Fewest CPU cycles spent on processing any single audio quantum since the last call.
     */
    MinimumCyclesPerQuantum : UInt32

    /**
     * Most CPU cycles spent on processing any single audio quantum since the last call.
     */
    MaximumCyclesPerQuantum : UInt32

    /**
     * Total memory currently in use.
     */
    MemoryUsageInBytes : UInt32

    /**
     * Minimum delay that occurs between the time a sample is read from a source buffer and the time it reaches the speakers. 
     * 
     * <table>
     * <tr>
     * <th>Windows</th>
     * </tr>
     * <tr>
     * <td>The delay reported is a variable value equal to the rough distance between the last sample submitted to the driver by XAudio2 and the sample currently playing. The following factors can affect the delay: playing multichannel audio on a hardware-accelerated device; the type of audio device (WavePci, WaveCyclic, or WaveRT); and, to a lesser extent, audio hardware implementation.
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>The delay reported is a fixed value, which is normally 1,024 samples (21.333 ms at 48 kHz). If <b>XOverrideSpeakerConfig</b> has been called using the <b>XAUDIOSPEAKERCONFIG_LOW_LATENCY</b> flag, the delay reported is 512 samples (10.667 ms at 48 kHz).
     * </td>
     * </tr>
     * </table>
     */
    CurrentLatencyInSamples : UInt32

    /**
     * Total audio dropouts since the engine started.
     */
    GlitchesSinceEngineStarted : UInt32

    /**
     * Number of source voices currently playing.
     */
    ActiveSourceVoiceCount : UInt32

    /**
     * Total number of source voices currently in existence.
     */
    TotalSourceVoiceCount : UInt32

    /**
     * Number of submix voices currently playing.
     */
    ActiveSubmixVoiceCount : UInt32

    /**
     * Number of resampler xAPOs currently active.
     */
    ActiveResamplerCount : UInt32

    /**
     * Number of matrix mix xAPOs currently active.
     */
    ActiveMatrixMixCount : UInt32

    /**
     * <table>
     * <tr>
     * <th>Windows</th>
     * </tr>
     * <tr>
     * <td>Unsupported.</td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>Number of source voices decoding XMA data.</td>
     * </tr>
     * </table>
     */
    ActiveXmaSourceVoices : UInt32

    /**
     * <table>
     * <tr>
     * <th>Windows</th>
     * </tr>
     * <tr>
     * <td>Unsupported.</td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Xbox 360</th>
     * </tr>
     * <tr>
     * <td>A voice can use more than one XMA stream.</td>
     * </tr>
     * </table>
     */
    ActiveXmaStreams : UInt32

}
