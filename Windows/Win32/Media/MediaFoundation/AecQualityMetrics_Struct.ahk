#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains quality metrics for acoustic echo cancellation (AEC). This structure is used with the MFPKEY_WMAAECMA_RETRIEVE_TS_STATS property.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/ns-wmcodecdsp-aecqualitymetrics_struct
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class AecQualityMetrics_Struct extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Time stamp that indicates when the quality metrics were collected.
     * @type {Integer}
     */
    i64Timestamp {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * AEC convergence flag.
     * @type {Integer}
     */
    ConvergenceFlag {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * If <b>TRUE</b>, the input signal from the audio capture device was clipped.
     * @type {Integer}
     */
    MicClippedFlag {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * If <b>TRUE</b>, the input signal from the audio capture device was silent or too quiet.
     * @type {Integer}
     */
    MicSilenceFlag {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * If <b>TRUE</b>, positive feedback is causing a chirping sound.
     * @type {Integer}
     */
    PstvFeadbackFlag {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * If <b>TRUE</b>, the input signal from the audio rendering device was clipped.
     * @type {Integer}
     */
    SpkClippedFlag {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * If <b>TRUE</b>, the input signal from the audio rendering device was silent or too quiet.
     * @type {Integer}
     */
    SpkMuteFlag {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * A glitch occurred in the input data.
     * @type {Integer}
     */
    GlitchFlag {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * Double talk flag.
     * @type {Integer}
     */
    DoubleTalkFlag {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * Number of glitches.
     * @type {Integer}
     */
    uGlitchCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of times the audio capture signal was clipped.
     * @type {Integer}
     */
    uMicClipCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Running duration of the AEC process.
     * @type {Float}
     */
    fDuration {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Long-term average variance in the time stamps.
     * @type {Float}
     */
    fTSVariance {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Long-term average drift rate in the time stamps.
     * @type {Float}
     */
    fTSDriftRate {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * Near-end voice level after AEC processing.
     * @type {Float}
     */
    fVoiceLevel {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * Noise level of the audio capture signal.
     * @type {Float}
     */
    fNoiseLevel {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Echo return loss enhancement (ERLE).
     * @type {Float}
     */
    fERLE {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Average ERLE over the entire duration of AEC processing.
     * @type {Float}
     */
    fAvgERLE {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * Reserved
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
