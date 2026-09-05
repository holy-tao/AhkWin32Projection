#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class EAudioConstriction extends Win32Enum {

    /**
     * Native name: eAudioConstrictionOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: eAudioConstriction48_16
     * @type {Integer (Int32)}
     */
    static Constriction48_16 => 1

    /**
     * Native name: eAudioConstriction44_16
     * @type {Integer (Int32)}
     */
    static Constriction44_16 => 2

    /**
     * Native name: eAudioConstriction14_14
     * @type {Integer (Int32)}
     */
    static Constriction14_14 => 3

    /**
     * Native name: eAudioConstrictionMute
     * @type {Integer (Int32)}
     */
    static Mute => 4
}
