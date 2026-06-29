#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_PARAM_ALPN_ID {
    #StructPack 8

    cBytes : Int8

    pbId : IntPtr

}
