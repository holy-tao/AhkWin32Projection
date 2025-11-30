#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_ET extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_Require => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_RequireMax => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_ET_Optional => 3
}
