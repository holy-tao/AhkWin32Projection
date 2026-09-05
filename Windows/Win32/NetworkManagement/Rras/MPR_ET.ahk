#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class MPR_ET extends Win32Enum {

    /**
     * Native name: MPR_ET_None
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Native name: MPR_ET_Require
     * @type {Integer (UInt32)}
     */
    static Require => 1

    /**
     * Native name: MPR_ET_RequireMax
     * @type {Integer (UInt32)}
     */
    static RequireMax => 2

    /**
     * Native name: MPR_ET_Optional
     * @type {Integer (UInt32)}
     */
    static Optional => 3
}
