#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the format of a spherical video frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.sphericalvideoframeformat
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class SphericalVideoFrameFormat extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Unsupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static Equirectangular => 2
}
