#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPVFEATURE extends Win32Enum {

    /**
     * Native name: SPVFEATURE_STRESSED
     * @type {Integer (Int32)}
     */
    static STRESSED => 1

    /**
     * Native name: SPVFEATURE_EMPHASIS
     * @type {Integer (Int32)}
     */
    static EMPHASIS => 2
}
