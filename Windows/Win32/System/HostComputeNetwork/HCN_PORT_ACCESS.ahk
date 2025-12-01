#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCN_PORT_ACCESS
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_ACCESS
 * @namespace Windows.Win32.System.HostComputeNetwork
 * @version v4.0.30319
 */
class HCN_PORT_ACCESS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HCN_PORT_ACCESS_EXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HCN_PORT_ACCESS_SHARED => 2
}
