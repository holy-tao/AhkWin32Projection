#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SLGP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_SHORTPATH => 1

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_UNCPRIORITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_RAWPATH => 4

    /**
     * @type {Integer (Int32)}
     */
    static SLGP_RELATIVEPRIORITY => 8
}
