#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PXE_DHCPV6_OPTION structure can be used with the Windows Deployment Services PXE Server API.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_option
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCPV6_OPTION {
    #StructPack 2

    /**
     * A DHCPv6 option type.
     */
    OptionCode : UInt16

    /**
     * Length of the option value.
     */
    DataLength : UInt16

    /**
     * The option value.
     */
    Data : Int8[1]

}
