#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether the thumbnail is an icon or an image.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.thumbnailtype
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class ThumbnailType extends Win32Enum{

    /**
     * The thumbnail is an image.
     * @type {Integer (Int32)}
     */
    static Image => 0

    /**
     * The thumbnail is an icon.
     * @type {Integer (Int32)}
     */
    static Icon => 1
}
