#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechDataKeyLocation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SDKLDefaultLocation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDKLCurrentUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDKLLocalMachine => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDKLCurrentConfig => 5
}
