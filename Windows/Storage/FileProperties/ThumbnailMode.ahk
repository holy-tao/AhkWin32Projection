#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the purpose of the thumbnail to determine how to adjust the thumbnail image to retrieve.
 * @remarks
 * Windows uses the default, preferred size as a guide to scale the thumbnail image without reducing the quality of the image. It does not guarantee the size of the thumbnail image that is retrieved.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.thumbnailmode
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class ThumbnailMode extends Win32Enum{

    /**
     * To display previews of picture files.
     * 
     * + **Default, preferred size:** Medium, preferably at least 190 pixels (if the image size is 190 x 130)
     * + **Aspect ratio:** Uniform, wide aspect ratio of about .7 (190 x 130 if the preferred size is 190)
     * @type {Integer (Int32)}
     */
    static PicturesView => 0

    /**
     * To display previews of video files.
     * 
     * + **Default, preferred size:** Medium, preferably at least 190 pixels (if the video size is 190 x 130)
     * + **Aspect ratio:** Uniform, wide aspect ratio of about .7 (190 x 130 if the requested size is 190)
     * @type {Integer (Int32)}
     */
    static VideosView => 1

    /**
     * To display previews of music files.
     * 
     * + **Default, preferred size:** Small, preferably at least 40 x 40 pixels
     * + **Aspect ratio:** Uniform, square aspect ratio
     * @type {Integer (Int32)}
     */
    static MusicView => 2

    /**
     * To display previews of document files.
     * 
     * + **Default, preferred size:** Small, preferably at least 40 x 40 pixels
     * + **Aspect ratio:** Uniform, square aspect ratio
     * @type {Integer (Int32)}
     */
    static DocumentsView => 3

    /**
     * To display previews of files (or other items) in a list.
     * 
     * + **Default, preferred size:** Small, preferably at least 40 x 40 pixels
     * + **Aspect ratio:** Uniform, square aspect ratio
     * @type {Integer (Int32)}
     */
    static ListView => 4

    /**
     * To display a preview of any single item (like a file, folder, or file group).
     * 
     * + **Default, preferred size:** Large, at least 256 pixels on the longest side
     * + **Aspect ratio:** Variable, uses the original aspect ratio of the file
     * @type {Integer (Int32)}
     */
    static SingleItem => 5
}
