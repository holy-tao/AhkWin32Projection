#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCONUI_CONNECT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NCUC_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NCUC_NO_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCUC_ENABLE_DISABLE => 2
}
