#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct WBCL_LogHdr {
    #StructPack 4

    signature : UInt32

    version : UInt32

    entries : UInt32

    length : UInt32

}
