#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPCONTEXTSTATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPCS_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPCS_ENABLED => 1
}
