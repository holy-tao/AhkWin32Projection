#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the spherical projection mode used for rendering video.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.sphericalvideoprojectionmode
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class SphericalVideoProjectionMode extends Win32Enum{

    /**
     * The video is rendered using spherical projection.
     * @type {Integer (Int32)}
     */
    static Spherical => 0

    /**
     * The video is rendered flat with no spherical projection.
     * @type {Integer (Int32)}
     */
    static Flat => 1
}
