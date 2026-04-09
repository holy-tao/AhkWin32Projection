#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class TRANSPARENTBARVERTSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PBBVS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static PBBVS_PARTIAL => 2
}
