#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechRecoContextState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SRCS_Disabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static SRCS_Enabled => 1
}
