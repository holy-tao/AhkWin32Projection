#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_SVCB_PARAM_ALPN_ID.ahk" { DNS_SVCB_PARAM_ALPN_ID }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_PARAM_ALPN {
    #StructPack 8

    cIds : UInt16

    rgIds : DNS_SVCB_PARAM_ALPN_ID[1]

}
