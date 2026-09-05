#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class IGNOREMIME extends Win32Enum {

    /**
     * Native name: IGNOREMIME_PROMPT
     * @type {Integer (Int32)}
     */
    static PROMPT => 1

    /**
     * Native name: IGNOREMIME_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 2
}
