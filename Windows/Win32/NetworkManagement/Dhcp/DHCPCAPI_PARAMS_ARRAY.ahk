#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCPAPI_PARAMS.ahk" { DHCPAPI_PARAMS }

/**
 * The DHCPCAPI_PARAMS_ARRAY structure stores an array of DHCPAPI_PARAMS structures used to query DHCP parameters.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpcsdk/ns-dhcpcsdk-dhcpcapi_params_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPCAPI_PARAMS_ARRAY {
    #StructPack 8

    /**
     * Number of elements in the <b>Params</b> array.
     */
    nParams : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpcsdk/ns-dhcpcsdk-dhcpapi_params">DHCPAPI_PARAMS</a> structures.
     */
    Params : DHCPAPI_PARAMS.Ptr

}
