#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
class FEEDS_EVENTS_MASK extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FEM_FOLDEREVENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static FEM_FEEDEVENTS => 2
}
