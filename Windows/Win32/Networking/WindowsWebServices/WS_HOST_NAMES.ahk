#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * A structure containing a list of host names.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_host_names
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HOST_NAMES {
    #StructPack 8

    /**
     * A list of host names.  Each host name can be a DNS name or
     *                     an IPv4 or IPv6 address.  IPv6 addresses are enclosed
     *                     in brackets ('[' address ']').
     */
    hostNames : WS_STRING.Ptr

    /**
     * The number of elements in the hostNames array.
     */
    hostNameCount : UInt32

}
