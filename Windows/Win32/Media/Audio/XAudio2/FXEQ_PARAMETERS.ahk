#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Parameters for use with the FXEQ XAPO.
 * @remarks
 * Each band ranges from <b>FrequencyCenterN</b> - (<b>BandwidthN</b> / 2) to <b>FrequencyCenterN</b> + (<b>BandwidthN</b> / 2).
 * 
 * 
 * 
 * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
 * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xapofx/ns-xapofx-fxeq_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct FXEQ_PARAMETERS {
    #StructPack 4

    /**
     * Center frequency in Hz for band 0. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     */
    FrequencyCenter0 : Float32

    /**
     * The boost or decrease to frequencies in band 0. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     */
    Gain0 : Float32

    /**
     * Width of band 0. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     */
    Bandwidth0 : Float32

    /**
     * Center frequency in Hz for band 1. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     */
    FrequencyCenter1 : Float32

    /**
     * The boost or decrease to frequencies in band 1. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     */
    Gain1 : Float32

    /**
     * Width of band 1. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     */
    Bandwidth1 : Float32

    /**
     * Center frequency in Hz for band 2. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     */
    FrequencyCenter2 : Float32

    /**
     * The boost or decrease to frequencies in band 2. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     */
    Gain2 : Float32

    /**
     * Width of band 2. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     */
    Bandwidth2 : Float32

    /**
     * Center frequency in Hz for band 3. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     */
    FrequencyCenter3 : Float32

    /**
     * The boost or decrease to frequencies in band 3. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     */
    Gain3 : Float32

    /**
     * Width of band 3. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     */
    Bandwidth3 : Float32

}
