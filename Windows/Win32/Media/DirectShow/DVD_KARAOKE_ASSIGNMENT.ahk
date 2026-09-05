#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the speaker configuration for an audio stream.
 * @remarks
 * All channels within a stream will use the same speaker configuration, although the channels can be sent to different speakers within this configuration.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_karaoke_assignment
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_KARAOKE_ASSIGNMENT extends Win32Enum {

    /**
     * Reserved.
     * Native name: DVD_Assignment_reserved0
     * @type {Integer (Int32)}
     */
    static reserved0 => 0

    /**
     * Reserved.
     * Native name: DVD_Assignment_reserved1
     * @type {Integer (Int32)}
     */
    static reserved1 => 1

    /**
     * The stream is assigned to the left and right speakers.
     * Native name: DVD_Assignment_LR
     * @type {Integer (Int32)}
     */
    static LR => 2

    /**
     * The stream is assigned to the left, right, and middle speakers.
     * Native name: DVD_Assignment_LRM
     * @type {Integer (Int32)}
     */
    static LRM => 3

    /**
     * The stream is assigned to the left, right, and audio1 speakers.
     * Native name: DVD_Assignment_LR1
     * @type {Integer (Int32)}
     */
    static LR1 => 4

    /**
     * The stream is assigned to the left, right, middle, and audio1 speakers.
     * Native name: DVD_Assignment_LRM1
     * @type {Integer (Int32)}
     */
    static LRM1 => 5

    /**
     * The stream is assigned to the left, right, and audio2 speakers.
     * Native name: DVD_Assignment_LR12
     * @type {Integer (Int32)}
     */
    static LR12 => 6

    /**
     * The stream is assigned to the left, right, middle, and audio2 speakers.
     * Native name: DVD_Assignment_LRM12
     * @type {Integer (Int32)}
     */
    static LRM12 => 7
}
