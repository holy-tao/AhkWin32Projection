#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class PFADDRESSTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PF_IPV4 => 0

    /**
     * @type {Integer (Int32)}
     */
    static PF_IPV6 => 1
}
