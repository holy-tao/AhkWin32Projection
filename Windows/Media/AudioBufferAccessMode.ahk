#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines the access mode of an [AudioBuffer](audiobuffer.md) returned by [AudioFrame.LockBuffer](audioframe_lockbuffer_1248676457.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audiobufferaccessmode
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class AudioBufferAccessMode extends Win32Enum{

    /**
     * The audio buffer is read-only.
     * @type {Integer (Int32)}
     */
    static Read => 0

    /**
     * The audio buffer can be written to and read from.
     * @type {Integer (Int32)}
     */
    static ReadWrite => 1

    /**
     * The audio buffer is write-only.
     * @type {Integer (Int32)}
     */
    static Write => 2
}
