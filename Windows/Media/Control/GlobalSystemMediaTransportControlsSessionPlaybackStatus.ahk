#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The different states of playback the session could be in.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackstatus
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSessionPlaybackStatus extends Win32Enum{

    /**
     * The media is closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The media is opened.
     * @type {Integer (Int32)}
     */
    static Opened => 1

    /**
     * The media is changing.
     * @type {Integer (Int32)}
     */
    static Changing => 2

    /**
     * The media is stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 3

    /**
     * The media is playing.
     * @type {Integer (Int32)}
     */
    static Playing => 4

    /**
     * The media is paused.
     * @type {Integer (Int32)}
     */
    static Paused => 5
}
