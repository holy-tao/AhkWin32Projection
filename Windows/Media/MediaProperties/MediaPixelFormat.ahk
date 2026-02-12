#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for media pixel formats.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediapixelformat
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaPixelFormat extends Win32Enum{

    /**
     * NV12 media pixel format.
     * @type {Integer (Int32)}
     */
    static Nv12 => 0

    /**
     * BGRA8 media pixel format.
     * @type {Integer (Int32)}
     */
    static Bgra8 => 1

    /**
     * P010 media pixel format.
     * @type {Integer (Int32)}
     */
    static P010 => 2
}
