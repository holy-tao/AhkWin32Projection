#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the current stereoscopic render mode for a [MediaPlayer](mediaplayer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.stereoscopicvideorendermode
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class StereoscopicVideoRenderMode extends Win32Enum{

    /**
     * The [MediaPlayer](mediaplayer.md) is rendering in mono.
     * @type {Integer (Int32)}
     */
    static Mono => 0

    /**
     * The [MediaPlayer](mediaplayer.md) is rendering in stereo.
     * @type {Integer (Int32)}
     */
    static Stereo => 1
}
