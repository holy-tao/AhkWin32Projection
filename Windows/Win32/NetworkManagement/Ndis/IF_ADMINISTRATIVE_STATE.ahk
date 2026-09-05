#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class IF_ADMINISTRATIVE_STATE extends Win32Enum {

    /**
     * Native name: IF_ADMINISTRATIVE_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * Native name: IF_ADMINISTRATIVE_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 1

    /**
     * Native name: IF_ADMINISTRATIVE_DEMANDDIAL
     * @type {Integer (Int32)}
     */
    static DEMANDDIAL => 2
}
