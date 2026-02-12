#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Used to specify the frame precision algorithm when retrieving a thumbnail.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.videoframeprecision
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class VideoFramePrecision extends Win32Enum{

    /**
     * Use a more precise algorithm to get a thumbnail to the nearest frame.
     * @type {Integer (Int32)}
     */
    static NearestFrame => 0

    /**
     * Use a faster but less precise algorithm to get the thumbnail.
     * @type {Integer (Int32)}
     */
    static NearestKeyFrame => 1
}
