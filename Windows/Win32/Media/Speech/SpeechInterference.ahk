#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechInterference extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SINone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SINoise => 1

    /**
     * @type {Integer (Int32)}
     */
    static SINoSignal => 2

    /**
     * @type {Integer (Int32)}
     */
    static SITooLoud => 3

    /**
     * @type {Integer (Int32)}
     */
    static SITooQuiet => 4

    /**
     * @type {Integer (Int32)}
     */
    static SITooFast => 5

    /**
     * @type {Integer (Int32)}
     */
    static SITooSlow => 6
}
