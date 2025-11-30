#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_PROTOCOL
 * @namespace Windows.Win32.System.HostComputeNetwork
 * @version v4.0.30319
 */
class HCN_PORT_PROTOCOL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HCN_PORT_PROTOCOL_TCP => 1

    /**
     * @type {Integer (Int32)}
     */
    static HCN_PORT_PROTOCOL_UDP => 2

    /**
     * @type {Integer (Int32)}
     */
    static HCN_PORT_PROTOCOL_BOTH => 3
}
