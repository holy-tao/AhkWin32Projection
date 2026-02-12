#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines the audio processing modes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audioprocessing
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class AudioProcessing extends Win32Enum{

    /**
     * Normal audio signal processing.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Minimal audio signal processing.
     * @type {Integer (Int32)}
     */
    static Raw => 1
}
