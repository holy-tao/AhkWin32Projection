#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCN_PORT_ACCESS
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_ACCESS
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
class HCN_PORT_ACCESS extends Win32Enum {

    /**
     * Native name: HCN_PORT_ACCESS_EXCLUSIVE
     * @type {Integer (Int32)}
     */
    static EXCLUSIVE => 1

    /**
     * Native name: HCN_PORT_ACCESS_SHARED
     * @type {Integer (Int32)}
     */
    static SHARED => 2
}
