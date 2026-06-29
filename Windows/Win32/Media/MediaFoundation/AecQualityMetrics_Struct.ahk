#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains quality metrics for acoustic echo cancellation (AEC). This structure is used with the MFPKEY_WMAAECMA_RETRIEVE_TS_STATS property.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ns-wmcodecdsp-aecqualitymetrics_struct
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct AecQualityMetrics_Struct {
    #StructPack 8

    /**
     * Time stamp that indicates when the quality metrics were collected.
     */
    i64Timestamp : Int64

    /**
     * AEC convergence flag.
     */
    ConvergenceFlag : Int8

    /**
     * If <b>TRUE</b>, the input signal from the audio capture device was clipped.
     */
    MicClippedFlag : Int8

    /**
     * If <b>TRUE</b>, the input signal from the audio capture device was silent or too quiet.
     */
    MicSilenceFlag : Int8

    /**
     * If <b>TRUE</b>, positive feedback is causing a chirping sound.
     */
    PstvFeadbackFlag : Int8

    /**
     * If <b>TRUE</b>, the input signal from the audio rendering device was clipped.
     */
    SpkClippedFlag : Int8

    /**
     * If <b>TRUE</b>, the input signal from the audio rendering device was silent or too quiet.
     */
    SpkMuteFlag : Int8

    /**
     * A glitch occurred in the input data.
     */
    GlitchFlag : Int8

    /**
     * Double talk flag.
     */
    DoubleTalkFlag : Int8

    /**
     * Number of glitches.
     */
    uGlitchCount : UInt32

    /**
     * Number of times the audio capture signal was clipped.
     */
    uMicClipCount : UInt32

    /**
     * Running duration of the AEC process.
     */
    fDuration : Float32

    /**
     * Long-term average variance in the time stamps.
     */
    fTSVariance : Float32

    /**
     * Long-term average drift rate in the time stamps.
     */
    fTSDriftRate : Float32

    /**
     * Near-end voice level after AEC processing.
     */
    fVoiceLevel : Float32

    /**
     * Noise level of the audio capture signal.
     */
    fNoiseLevel : Float32

    /**
     * Echo return loss enhancement (ERLE).
     */
    fERLE : Float32

    /**
     * Average ERLE over the entire duration of AEC processing.
     */
    fAvgERLE : Float32

    /**
     * Reserved
     */
    dwReserved : UInt32

}
