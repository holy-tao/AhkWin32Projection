#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHFMT_OPT extends Win32BitflagEnum {

    /**
     * Native name: SHFMT_OPT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SHFMT_OPT_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 1

    /**
     * Native name: SHFMT_OPT_SYSONLY
     * @type {Integer (Int32)}
     */
    static SYSONLY => 2
}
