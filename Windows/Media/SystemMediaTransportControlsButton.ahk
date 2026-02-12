#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines values for the buttons on the [SystemMediaTransportControls](systemmediatransportcontrols.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolsbutton
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControlsButton extends Win32Enum{

    /**
     * The play button.
     * @type {Integer (Int32)}
     */
    static Play => 0

    /**
     * The pause button.
     * @type {Integer (Int32)}
     */
    static Pause => 1

    /**
     * The stop button.
     * @type {Integer (Int32)}
     */
    static Stop => 2

    /**
     * The record button.
     * @type {Integer (Int32)}
     */
    static Record => 3

    /**
     * The fast forward button.
     * @type {Integer (Int32)}
     */
    static FastForward => 4

    /**
     * The rewind button.
     * @type {Integer (Int32)}
     */
    static Rewind => 5

    /**
     * The next button.
     * @type {Integer (Int32)}
     */
    static Next => 6

    /**
     * The previous button.
     * @type {Integer (Int32)}
     */
    static Previous => 7

    /**
     * The channel up button.
     * @type {Integer (Int32)}
     */
    static ChannelUp => 8

    /**
     * The channel down button.
     * @type {Integer (Int32)}
     */
    static ChannelDown => 9
}
