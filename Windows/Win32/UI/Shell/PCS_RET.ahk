#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PCS_RET extends Win32BitflagEnum {

    /**
     * Native name: PCS_FATAL
     * @type {Integer (UInt32)}
     */
    static FATAL => 2147483648

    /**
     * Native name: PCS_REPLACEDCHAR
     * @type {Integer (UInt32)}
     */
    static REPLACEDCHAR => 1

    /**
     * Native name: PCS_REMOVEDCHAR
     * @type {Integer (UInt32)}
     */
    static REMOVEDCHAR => 2

    /**
     * Native name: PCS_TRUNCATED
     * @type {Integer (UInt32)}
     */
    static TRUNCATED => 4

    /**
     * Native name: PCS_PATHTOOLONG
     * @type {Integer (UInt32)}
     */
    static PATHTOOLONG => 8
}
