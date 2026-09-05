#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DMUS_CLOCKTYPE extends Win32Enum {

    /**
     * Native name: DMUS_CLOCK_SYSTEM
     * @type {Integer (Int32)}
     */
    static CLOCK_SYSTEM => 0

    /**
     * Native name: DMUS_CLOCK_WAVE
     * @type {Integer (Int32)}
     */
    static CLOCK_WAVE => 1
}
