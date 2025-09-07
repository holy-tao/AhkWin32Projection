#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechTokenContext{

    /**
     * @type {Integer (UInt32)}
     */
    static STCInprocServer => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STCInprocHandler => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STCLocalServer => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STCRemoteServer => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STCAll => 23
}
