#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ENCAP_ENTRY {
    #StructPack 2

    usEtherType : UInt16

    usEncapType : UInt16

}
