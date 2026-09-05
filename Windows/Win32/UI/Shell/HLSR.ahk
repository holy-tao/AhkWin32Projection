#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLSR extends Win32Enum {

    /**
     * Native name: HLSR_HOME
     * @type {Integer (Int32)}
     */
    static HOME => 0

    /**
     * Native name: HLSR_SEARCHPAGE
     * @type {Integer (Int32)}
     */
    static SEARCHPAGE => 1

    /**
     * Native name: HLSR_HISTORYFOLDER
     * @type {Integer (Int32)}
     */
    static HISTORYFOLDER => 2
}
