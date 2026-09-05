#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the audio format of a DVD.
 * @remarks
 * This enumeration is a member of the [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_audio_format
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_AUDIO_FORMAT extends Win32Enum {

    /**
     * Audio format is Dolby AC-3.
     * Native name: DVD_AudioFormat_AC3
     * @type {Integer (Int32)}
     */
    static AC3 => 0

    /**
     * Audio format is MPEG-1.
     * Native name: DVD_AudioFormat_MPEG1
     * @type {Integer (Int32)}
     */
    static MPEG1 => 1

    /**
     * Audio format is MPEG-1 with dynamic range control.
     * Native name: DVD_AudioFormat_MPEG1_DRC
     * @type {Integer (Int32)}
     */
    static MPEG1_DRC => 2

    /**
     * Audio format is MPEG-2.
     * Native name: DVD_AudioFormat_MPEG2
     * @type {Integer (Int32)}
     */
    static MPEG2 => 3

    /**
     * Audio format is MPEG-2 with dynamic range control.
     * Native name: DVD_AudioFormat_MPEG2_DRC
     * @type {Integer (Int32)}
     */
    static MPEG2_DRC => 4

    /**
     * Audio format is Linear Pulse Code Modulated (LPCM).
     * Native name: DVD_AudioFormat_LPCM
     * @type {Integer (Int32)}
     */
    static LPCM => 5

    /**
     * Audio format is Digital Theater Systems (DTS).
     * Native name: DVD_AudioFormat_DTS
     * @type {Integer (Int32)}
     */
    static DTS => 6

    /**
     * Audio format is Sony Dynamic Digital Sound (SDDS).
     * Native name: DVD_AudioFormat_SDDS
     * @type {Integer (Int32)}
     */
    static SDDS => 7

    /**
     * Audio format is unrecognized.
     * Native name: DVD_AudioFormat_Other
     * @type {Integer (Int32)}
     */
    static Other => 8
}
