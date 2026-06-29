#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTSSBX_IP_ADDRESS.ahk" { WTSSBX_IP_ADDRESS }
#Import ".\WTSSBX_ADDRESS_FAMILY.ahk" { WTSSBX_ADDRESS_FAMILY }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a computer that is accepting remote connections.
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_connect_info
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_MACHINE_CONNECT_INFO {
    #StructPack 4

    /**
     * The fully qualified domain name (FQDN) of the computer.  The name cannot exceed 256 characters.
     */
    wczMachineFQDN : WCHAR[257]

    /**
     * The NetBIOS name of the computer. The name cannot exceed 16 characters.
     */
    wczMachineNetBiosName : WCHAR[17]

    /**
     * The number of IP addresses that are configured on the computer.
     */
    dwNumOfIPAddr : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_ip_address">WTSSBX_IP_ADDRESS</a> structures that indicate the IP addresses on this computer that are visible to Remote Desktop Connection (RDC) clients. This array cannot exceed 12 elements.
     */
    IPaddr : WTSSBX_IP_ADDRESS[12]

}
