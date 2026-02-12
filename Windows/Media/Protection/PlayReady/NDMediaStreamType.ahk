#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of a protected media stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndmediastreamtype
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDMediaStreamType extends Win32Enum{

    /**
     * The stream is an audio stream.
     * @type {Integer (Int32)}
     */
    static Audio => 1

    /**
     * The stream is a video stream.
     * @type {Integer (Int32)}
     */
    static Video => 2
}
