#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the stereoscopic video packing mode of a video stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.stereoscopicvideopackingmode
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class StereoscopicVideoPackingMode extends Win32Enum{

    /**
     * The video stream does not use stereoscopic video packing.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The video stream packs stereoscopic video frames side by side.
     * @type {Integer (Int32)}
     */
    static SideBySide => 1

    /**
     * The video stream packs stereoscopic video frames using the top and bottom of the frame.
     * @type {Integer (Int32)}
     */
    static TopBottom => 2
}
