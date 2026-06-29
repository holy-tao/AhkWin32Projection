#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct RTR_TOC_ENTRY {
    #StructPack 4

    InfoType : UInt32

    InfoSize : UInt32

    Count : UInt32

    Offset : UInt32

}
