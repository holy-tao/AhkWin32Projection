#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechRecognizerState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SRSInactive => 0

    /**
     * @type {Integer (Int32)}
     */
    static SRSActive => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRSActiveAlways => 2

    /**
     * @type {Integer (Int32)}
     */
    static SRSInactiveWithPurge => 3
}
