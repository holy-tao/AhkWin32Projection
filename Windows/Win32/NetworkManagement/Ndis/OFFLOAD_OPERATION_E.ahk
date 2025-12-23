#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_OPERATION_E extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AUTHENTICATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ENCRYPT => 2
}
