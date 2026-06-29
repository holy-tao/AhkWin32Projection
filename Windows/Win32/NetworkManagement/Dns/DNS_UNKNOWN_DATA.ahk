#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_UNKNOWN_DATA {
    #StructPack 4

    dwByteCount : UInt32

    bData : Int8[1]

}
