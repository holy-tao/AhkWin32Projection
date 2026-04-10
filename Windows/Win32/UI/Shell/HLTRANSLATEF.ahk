#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLTRANSLATEF extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HLTRANSLATEF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLTRANSLATEF_DONTAPPLYDEFAULTPREFIX => 1
}
