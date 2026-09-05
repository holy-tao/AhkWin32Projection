#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHFMT_RET extends Win32Enum {

    /**
     * Native name: SHFMT_ERROR
     * @type {Integer (UInt32)}
     */
    static ERROR => 4294967295

    /**
     * Native name: SHFMT_CANCEL
     * @type {Integer (UInt32)}
     */
    static CANCEL => 4294967294

    /**
     * Native name: SHFMT_NOFORMAT
     * @type {Integer (UInt32)}
     */
    static NOFORMAT => 4294967293
}
