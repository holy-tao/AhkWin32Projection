#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The _AM_AUDIO_RENDERER_STAT_PARAM enumeration specifies which performance information to retrieve from the audio renderer.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-_am_audio_renderer_stat_param
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _AM_AUDIO_RENDERER_STAT_PARAM extends Win32Enum{

    /**
     * <i>Param1</i>: The cumulative number of breaks in the audio stream.
     * 
     * <i>Param2</i>: Not used.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_BREAK_COUNT => 1

    /**
     * <i>Param1</i>: Indicates the current rate-matching mode. The value is a bitwise combination of the following:
     * 
     * <ul>
     * <li>0x00: No rate matching.</li>
     * <li>0x01: Match rates to a live source.</li>
     * <li>0x02: Match rates based on the rate of the incoming audio data.</li>
     * <li>0x04: Match rates with the filter graph's reference clock (when the clock is not provided by the audio renderer).</li>
     * <li>0x10: Match rates based on the time stamps of the audio samples.</li>
     * </ul>
     * <i>Param2</i>: Not used.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SLAVE_MODE => 2

    /**
     * <i>Param1</i>: The cumulative amount of silence the audio renderer has inserted, due to gaps in the time stamps of the incoming samples. The value is given in milliseconds.
     * 
     * <i>Param2</i>: Not used.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SILENCE_DUR => 3

    /**
     * <i>Param1</i>: The duration of the most recent audio buffer, in milliseconds.
     * 
     * <i>Param2</i>: Not used.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_LAST_BUFFER_DUR => 4

    /**
     * <i>Param1</i>: The cumulative number of discontinuities in the audio stream.
     * 
     * <i>Param2</i>: Not used.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_DISCONTINUITIES => 5

    /**
     * <i>Param1</i>: The sample rate that the audio renderer is matching, in samples per second.
     * 
     * <i>Param2</i>: Not used.
     * 
     * Valid only when the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/directsound-renderer-filter">DirectSound Renderer</a> is matching rates to another clock or a live source.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SLAVE_RATE => 6

    /**
     * <i>Param1</i>: The amount of data dropped to stay in sync, in milliseconds.
     * 
     * <i>Param2</i>: Not used.
     * 
     * Applies only when the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/audio-renderer--waveout--filter">Audio Renderer (WaveOut)</a> filter is matching rates to a master clock.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SLAVE_DROPWRITE_DUR => 7

    /**
     * <i>Param1</i>: The highest difference noted between the audio renderer's clock and the clock it is trying to match.
     * 
     * <i>Param2</i>: The lowest difference noted between the audio renderer's clock and the clock it is trying to match.
     * 
     * Valid only when the audio renderer is matching rates to a master clock.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SLAVE_HIGHLOWERROR => 8

    /**
     * <i>Param1</i>: The last high error, in milliseconds. A <i>high error</i> occurs when the audio renderer falls behind the clock.
     * 
     * <i>Param2</i>: The last low error, in milliseconds. A <i>low error</i> occurs when the audio renderer runs ahead of the clock. 
     * 
     * Valid only when the audio renderer is matching rates to a master clock.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SLAVE_LASTHIGHLOWERROR => 9

    /**
     * <i>Param1</i>: The accumulated difference between the audio renderer and the master clock, including adjustments made by dropping samples or inserting gaps.
     * 
     * <i>Param2</i>: Not used.
     * 
     * Valid only when the audio renderer is matching rates to another clock or a live source.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_SLAVE_ACCUMERROR => 10

    /**
     * <i>Param1</i>: How much audio data is in the audio buffer, as a percentage.
     * 
     * <i>Param2</i>: Not used.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_BUFFERFULLNESS => 11

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static AM_AUDREND_STAT_PARAM_JITTER => 12
}
