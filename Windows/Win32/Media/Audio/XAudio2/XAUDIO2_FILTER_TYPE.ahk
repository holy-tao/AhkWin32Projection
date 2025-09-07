#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the filter type.
 * @remarks
 * <div class="alert"><b>Note</b>  Note that the DirectX SDK versions of XAUDIO2 do not support the <b>LowPassOnePoleFilter</b> or the <b>HighPassOnePoleFilter</b>.    </div>
  * <div> </div>
  * <h3><a id="Platform_Requirements"></a><a id="platform_requirements"></a><a id="PLATFORM_REQUIREMENTS"></a>Platform Requirements</h3>
  * Windows 10 (XAudio2.9); Windows 8, Windows Phone 8 (XAudio 2.8); DirectX SDK (XAudio 2.7)
 * @see https://learn.microsoft.com/windows/win32/api/xaudio2/ne-xaudio2-xaudio2_filter_type
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class XAUDIO2_FILTER_TYPE{

    /**
     * Attenuates (reduces) frequencies above the cutoff frequency.
     * @type {Integer (Int32)}
     */
    static LowPassFilter => 0

    /**
     * Attenuates frequencies outside a given range.
     * @type {Integer (Int32)}
     */
    static BandPassFilter => 1

    /**
     * Attenuates frequencies below the cutoff frequency.
     * @type {Integer (Int32)}
     */
    static HighPassFilter => 2

    /**
     * Attenuates frequencies inside a given range.
     * @type {Integer (Int32)}
     */
    static NotchFilter => 3

    /**
     * Attenuates frequencies above the cutoff frequency. This is a one-pole filter, and <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a>.<b>OneOverQ</b> has no effect.
     * @type {Integer (Int32)}
     */
    static LowPassOnePoleFilter => 4

    /**
     * Attenuates frequencies below the cutoff frequency. This is a one-pole filter, and <a href="https://docs.microsoft.com/windows/desktop/api/xaudio2/ns-xaudio2-xaudio2_filter_parameters">XAUDIO2_FILTER_PARAMETERS</a>.<b>OneOverQ</b> has no effect.
     * @type {Integer (Int32)}
     */
    static HighPassOnePoleFilter => 5
}
