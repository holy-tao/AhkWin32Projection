#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCN_PORT_PROTOCOL
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_PROTOCOL
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
class HCN_PORT_PROTOCOL extends Win32Enum {

    /**
     * Native name: HCN_PORT_PROTOCOL_TCP
     * @type {Integer (Int32)}
     */
    static TCP => 1

    /**
     * Native name: HCN_PORT_PROTOCOL_UDP
     * @type {Integer (Int32)}
     */
    static UDP => 2

    /**
     * Native name: HCN_PORT_PROTOCOL_BOTH
     * @type {Integer (Int32)}
     */
    static BOTH => 3
}
