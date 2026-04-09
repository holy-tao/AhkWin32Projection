#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPAUDIOOPTIONS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPAO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPAO_RETAIN_AUDIO => 1
}
