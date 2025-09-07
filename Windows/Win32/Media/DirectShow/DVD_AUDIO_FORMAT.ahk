#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the audio format of a DVD.
 * @remarks
 * This enumeration is a member of the [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_audio_format
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_AUDIO_FORMAT{

    /**
     * Audio format is Dolby AC-3.
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_AC3 => 0

    /**
     * Audio format is MPEG-1.
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_MPEG1 => 1

    /**
     * Audio format is MPEG-1 with dynamic range control.
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_MPEG1_DRC => 2

    /**
     * Audio format is MPEG-2.
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_MPEG2 => 3

    /**
     * Audio format is MPEG-2 with dynamic range control.
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_MPEG2_DRC => 4

    /**
     * Audio format is Linear Pulse Code Modulated (LPCM).
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_LPCM => 5

    /**
     * Audio format is Digital Theater Systems (DTS).
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_DTS => 6

    /**
     * Audio format is Sony Dynamic Digital Sound (SDDS).
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_SDDS => 7

    /**
     * Audio format is unrecognized.
     * @type {Integer (Int32)}
     */
    static DVD_AudioFormat_Other => 8
}
