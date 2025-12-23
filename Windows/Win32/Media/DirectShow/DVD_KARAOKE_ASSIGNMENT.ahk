#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the speaker configuration for an audio stream.
 * @remarks
 * All channels within a stream will use the same speaker configuration, although the channels can be sent to different speakers within this configuration.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_assignment
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_KARAOKE_ASSIGNMENT extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_reserved0 => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_reserved1 => 1

    /**
     * The stream is assigned to the left and right speakers.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_LR => 2

    /**
     * The stream is assigned to the left, right, and middle speakers.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_LRM => 3

    /**
     * The stream is assigned to the left, right, and audio1 speakers.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_LR1 => 4

    /**
     * The stream is assigned to the left, right, middle, and audio1 speakers.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_LRM1 => 5

    /**
     * The stream is assigned to the left, right, and audio2 speakers.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_LR12 => 6

    /**
     * The stream is assigned to the left, right, middle, and audio2 speakers.
     * @type {Integer (Int32)}
     */
    static DVD_Assignment_LRM12 => 7
}
