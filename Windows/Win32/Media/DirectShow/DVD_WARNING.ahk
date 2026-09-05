#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies DVD warning conditions.
 * @see https://learn.microsoft.com/windows/win32/api/dvdevcod/ne-dvdevcod-dvd_warning
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_WARNING extends Win32Enum {

    /**
     * DVD-Video disc is authored incorrectly. Playback can continue, but unexpected behavior might occur.
     * Native name: DVD_WARNING_InvalidDVD1_0Disc
     * @type {Integer (Int32)}
     */
    static InvalidDVD1_0Disc => 1

    /**
     * A decoder would not support the current format. Playback of a stream (audio, video or subpicture) might not function. <i>lParam2</i> of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-dvd-warning">EC_DVD_WARNING</a> event notification code contains the stream type (see <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-am_dvd_stream_flags">AM_DVD_STREAM_FLAGS</a>).
     * Native name: DVD_WARNING_FormatNotSupported
     * @type {Integer (Int32)}
     */
    static FormatNotSupported => 2

    /**
     * The internal DVD navigation command processor attempted to process an illegal command.
     * Native name: DVD_WARNING_IllegalNavCommand
     * @type {Integer (Int32)}
     */
    static IllegalNavCommand => 3

    /**
     * File Open failed.
     * Native name: DVD_WARNING_Open
     * @type {Integer (Int32)}
     */
    static Open => 4

    /**
     * File Seek failed.
     * Native name: DVD_WARNING_Seek
     * @type {Integer (Int32)}
     */
    static Seek => 5

    /**
     * File Read failed.
     * Native name: DVD_WARNING_Read
     * @type {Integer (Int32)}
     */
    static Read => 6
}
