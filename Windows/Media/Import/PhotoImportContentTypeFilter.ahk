#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the content types that are included in a photo import operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportcontenttypefilter
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportContentTypeFilter extends Win32Enum{

    /**
     * Include only images.
     * @type {Integer (Int32)}
     */
    static OnlyImages => 0

    /**
     * Include only videos.
     * @type {Integer (Int32)}
     */
    static OnlyVideos => 1

    /**
     * Include images and videos.
     * @type {Integer (Int32)}
     */
    static ImagesAndVideos => 2

    /**
     * Include images and videos located in the Camera Roll directory or any of its subdirectories.
     * @type {Integer (Int32)}
     */
    static ImagesAndVideosFromCameraRoll => 3
}
