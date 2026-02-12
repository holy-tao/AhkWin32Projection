#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the direction in of a mirror transform.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediamirroringoptions
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaMirroringOptions extends Win32BitflagEnum{

    /**
     * No mirroring.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Mirror horizontally.
     * @type {Integer (UInt32)}
     */
    static Horizontal => 1

    /**
     * Mirror vertically.
     * @type {Integer (UInt32)}
     */
    static Vertical => 2
}
