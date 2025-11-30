#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHFMT_RET extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SHFMT_ERROR => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SHFMT_CANCEL => 4294967294

    /**
     * @type {Integer (UInt32)}
     */
    static SHFMT_NOFORMAT => 4294967293
}
