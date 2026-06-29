#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IP6_ADDRESS.ahk" { IP6_ADDRESS }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_PARAM_IPV6 {
    #StructPack 8

    cIps : UInt16

    rgIps : IP6_ADDRESS[1]

}
