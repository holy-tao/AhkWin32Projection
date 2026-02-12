#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of media stream that failed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.failedmediastreamkind
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class FailedMediaStreamKind extends Win32Enum{

    /**
     * The stream type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The failed stream contains audio.
     * @type {Integer (Int32)}
     */
    static Audio => 1

    /**
     * The failed stream contains video.
     * @type {Integer (Int32)}
     */
    static Video => 2
}
