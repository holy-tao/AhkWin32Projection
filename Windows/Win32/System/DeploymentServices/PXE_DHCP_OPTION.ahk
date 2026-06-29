#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PXE_DHCP_OPTION structure can be used with the Windows Deployment Services PXE Server API.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcp_option
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_DHCP_OPTION {
    #StructPack 1

    /**
     * A DHCP option type.
     */
    OptionType : Int8

    /**
     * Length of the option value.
     */
    OptionLength : Int8

    /**
     * The option value.
     */
    OptionValue : Int8[1]

}
