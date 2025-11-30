#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechTokenShellFolder extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static STSF_AppData => 26

    /**
     * @type {Integer (Int32)}
     */
    static STSF_LocalAppData => 28

    /**
     * @type {Integer (Int32)}
     */
    static STSF_CommonAppData => 35

    /**
     * @type {Integer (Int32)}
     */
    static STSF_FlagCreate => 32768
}
