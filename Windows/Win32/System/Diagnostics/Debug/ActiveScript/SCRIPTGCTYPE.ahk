#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTGCTYPE extends Win32Enum {

    /**
     * Native name: SCRIPTGCTYPE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: SCRIPTGCTYPE_EXHAUSTIVE
     * @type {Integer (Int32)}
     */
    static EXHAUSTIVE => 1
}
