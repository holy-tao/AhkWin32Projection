#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for media formats for thumbnails.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediathumbnailformat
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaThumbnailFormat extends Win32Enum{

    /**
     * BMP media format.
     * @type {Integer (Int32)}
     */
    static Bmp => 0

    /**
     * BGRA8 media format.
     * @type {Integer (Int32)}
     */
    static Bgra8 => 1
}
