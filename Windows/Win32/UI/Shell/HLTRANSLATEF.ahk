#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLTRANSLATEF extends Win32Enum {

    /**
     * Native name: HLTRANSLATEF_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: HLTRANSLATEF_DONTAPPLYDEFAULTPREFIX
     * @type {Integer (Int32)}
     */
    static DONTAPPLYDEFAULTPREFIX => 1
}
