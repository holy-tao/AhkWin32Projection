#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SLGP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SLGP_SHORTPATH
     * @type {Integer (Int32)}
     */
    static SHORTPATH => 1

    /**
     * Native name: SLGP_UNCPRIORITY
     * @type {Integer (Int32)}
     */
    static UNCPRIORITY => 2

    /**
     * Native name: SLGP_RAWPATH
     * @type {Integer (Int32)}
     */
    static RAWPATH => 4

    /**
     * Native name: SLGP_RELATIVEPRIORITY
     * @type {Integer (Int32)}
     */
    static RELATIVEPRIORITY => 8
}
