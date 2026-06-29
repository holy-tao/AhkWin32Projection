#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCPV6CAPI_PARAMS.ahk" { DHCPV6CAPI_PARAMS }

/**
 * Contains an array of requested parameters.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6CAPI_PARAMS_ARRAY {
    #StructPack 8

    /**
     * Number of parameters in the array.
     */
    nParams : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6capi_params">DHCPV6CAPI_PARAMS</a> structure that contains a parameter.
     */
    Params : DHCPV6CAPI_PARAMS.Ptr

}
