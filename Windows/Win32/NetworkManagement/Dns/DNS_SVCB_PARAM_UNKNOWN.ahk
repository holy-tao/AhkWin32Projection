#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_PARAM_UNKNOWN {
    #StructPack 2

    cBytes : UInt16

    pbSvcParamValue : Int8[1]

}
