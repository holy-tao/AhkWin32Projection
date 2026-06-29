#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_PARAM_IPV4 {
    #StructPack 4

    cIps : UInt16

    rgIps : UInt32[1]

}
