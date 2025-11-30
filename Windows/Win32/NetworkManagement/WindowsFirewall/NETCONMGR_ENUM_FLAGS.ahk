#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCONMGR_ENUM_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NCME_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NCME_HIDDEN => 1
}
