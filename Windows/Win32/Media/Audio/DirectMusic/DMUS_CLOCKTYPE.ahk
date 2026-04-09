#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DMUS_CLOCKTYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DMUS_CLOCK_SYSTEM => 0

    /**
     * @type {Integer (Int32)}
     */
    static DMUS_CLOCK_WAVE => 1
}
