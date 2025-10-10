#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Parameters for use with the FXEQ XAPO.
 * @remarks
 * 
  * Each band ranges from <b>FrequencyCenterN</b> - (<b>BandwidthN</b> / 2) to <b>FrequencyCenterN</b> + (<b>BandwidthN</b> / 2).
  * 
  * 
  * 
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xapofx/ns-xapofx-fxeq_parameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class FXEQ_PARAMETERS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * Center frequency in Hz for band 0. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     * @type {Float}
     */
    FrequencyCenter0 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The boost or decrease to frequencies in band 0. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     * @type {Float}
     */
    Gain0 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Width of band 0. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     * @type {Float}
     */
    Bandwidth0 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Center frequency in Hz for band 1. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     * @type {Float}
     */
    FrequencyCenter1 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * The boost or decrease to frequencies in band 1. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     * @type {Float}
     */
    Gain1 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Width of band 1. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     * @type {Float}
     */
    Bandwidth1 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Center frequency in Hz for band 2. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     * @type {Float}
     */
    FrequencyCenter2 {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * The boost or decrease to frequencies in band 2. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     * @type {Float}
     */
    Gain2 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Width of band 2. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     * @type {Float}
     */
    Bandwidth2 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * Center frequency in Hz for band 3. Must be between FXEQ_MIN_FREQUENCY_CENTER and FXEQ_MAX_FREQUENCY_CENTER.
     * @type {Float}
     */
    FrequencyCenter3 {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * The boost or decrease to frequencies in band 3. Must be between FXEQ_MIN_GAIN and FXEQ_MAX_GAIN
     * @type {Float}
     */
    Gain3 {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Width of band 3. Must be between FXEQ_MIN_BANDWIDTH and FXEQ_MAX_BANDWIDTH.
     * @type {Float}
     */
    Bandwidth3 {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }
}
