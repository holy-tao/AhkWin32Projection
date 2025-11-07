#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes a network address.
 * @remarks
 * 
 * This structure is sent with the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-netaddr_getaddress">NetAddr_GetAddress</a> macro.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shellapi/ns-shellapi-nc_address
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NC_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/hkey-type">NET_ADDRESS_INFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/hkey-type">NET_ADDRESS_INFO</a>  structure that describes the network address, either a named address or an IP address.
     * @type {Pointer<NET_ADDRESS_INFO>}
     */
    pAddrInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>USHORT</b>
     * 
     * The network port number, if the address described by <b>pAddrInfo</b> is an IP address.
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * The prefix length corresponding to the address, if the address described by <b>pAddrInfo</b> is an IP address.
     * @type {Integer}
     */
    PrefixLength {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }
}
