#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates how to rotate the video to display it correctly.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.videoorientation
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class VideoOrientation extends Win32Enum{

    /**
     * No rotation needed. The video can be displayed using its current orientation.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Rotate the video 90 degrees.
     * @type {Integer (Int32)}
     */
    static Rotate90 => 90

    /**
     * Rotate the video counter-clockwise 180 degrees.
     * @type {Integer (Int32)}
     */
    static Rotate180 => 180

    /**
     * Rotate the video counter-clockwise 270 degrees.
     * @type {Integer (Int32)}
     */
    static Rotate270 => 270
}
