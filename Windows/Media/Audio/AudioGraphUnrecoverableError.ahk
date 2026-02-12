#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines unrecoverable errors for the audio graph.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographunrecoverableerror
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioGraphUnrecoverableError extends Win32Enum{

    /**
     * No unrecoverable errors were found.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The audio device has been lost.
     * @type {Integer (Int32)}
     */
    static AudioDeviceLost => 1

    /**
     * The audio session has been disconnected.
     * @type {Integer (Int32)}
     */
    static AudioSessionDisconnected => 2

    /**
     * An unknown failure occurred during creation of the audio graph.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 3
}
