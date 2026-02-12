#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the content type of an imported item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportcontenttype
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportContentType extends Win32Enum{

    /**
     * The content type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The item is an image.
     * @type {Integer (Int32)}
     */
    static Image => 1

    /**
     * The item is a video.
     * @type {Integer (Int32)}
     */
    static Video => 2
}
