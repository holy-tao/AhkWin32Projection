#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the different focus states the capture device can be in.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediacapturefocusstate
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class MediaCaptureFocusState extends Win32Enum{

    /**
     * The focus state is uninitialized.
     * @type {Integer (Int32)}
     */
    static Uninitialized => 0

    /**
     * The focus has been lost.
     * @type {Integer (Int32)}
     */
    static Lost => 1

    /**
     * Searching for focus.
     * @type {Integer (Int32)}
     */
    static Searching => 2

    /**
     * Focused.
     * @type {Integer (Int32)}
     */
    static Focused => 3

    /**
     * The attempt to focus has failed.
     * @type {Integer (Int32)}
     */
    static Failed => 4
}
