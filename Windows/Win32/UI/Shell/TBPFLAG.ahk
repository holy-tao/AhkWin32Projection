#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class TBPFLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_NOPROGRESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_INDETERMINATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_ERROR => 4

    /**
     * @type {Integer (Int32)}
     */
    static TBPF_PAUSED => 8
}
