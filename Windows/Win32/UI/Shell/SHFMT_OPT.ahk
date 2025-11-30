#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHFMT_OPT extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SHFMT_OPT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SHFMT_OPT_FULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SHFMT_OPT_SYSONLY => 2
}
