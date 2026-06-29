#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\NetworkManagement\IpHelper\NET_ADDRESS_INFO.ahk" { NET_ADDRESS_INFO }

/**
 * Contains information that describes a network address.
 * @remarks
 * This structure is sent with the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-netaddr_getaddress">NetAddr_GetAddress</a> macro.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-nc_address
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NC_ADDRESS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/hkey-type">NET_ADDRESS_INFO</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/shell/hkey-type">NET_ADDRESS_INFO</a>  structure that describes the network address, either a named address or an IP address.
     */
    pAddrInfo : NET_ADDRESS_INFO.Ptr

    /**
     * Type: <b>USHORT</b>
     * 
     * The network port number, if the address described by <b>pAddrInfo</b> is an IP address.
     */
    PortNumber : UInt16

    /**
     * Type: <b>BYTE</b>
     * 
     * The prefix length corresponding to the address, if the address described by <b>pAddrInfo</b> is an IP address.
     */
    PrefixLength : Int8

}
