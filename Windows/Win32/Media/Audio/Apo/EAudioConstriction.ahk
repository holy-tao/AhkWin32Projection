#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class EAudioConstriction extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstrictionOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstriction48_16 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstriction44_16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstriction14_14 => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstrictionMute => 4
}
