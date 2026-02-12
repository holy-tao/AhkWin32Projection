#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the direction and angle of a media rotation transform.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediarotation
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaRotation extends Win32Enum{

    /**
     * No rotation.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Rotate 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise90Degrees => 1

    /**
     * Rotate 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise180Degrees => 2

    /**
     * Rotate 270 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise270Degrees => 3
}
