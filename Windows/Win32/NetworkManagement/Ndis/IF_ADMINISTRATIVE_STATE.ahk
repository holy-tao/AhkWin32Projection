#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class IF_ADMINISTRATIVE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IF_ADMINISTRATIVE_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static IF_ADMINISTRATIVE_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static IF_ADMINISTRATIVE_DEMANDDIAL => 2
}
