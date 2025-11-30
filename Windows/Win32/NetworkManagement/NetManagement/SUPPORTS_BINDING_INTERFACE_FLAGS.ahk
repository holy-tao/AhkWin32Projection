#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SUPPORTS_BINDING_INTERFACE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NCF_LOWER => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCF_UPPER => 2
}
