#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SMB_USE_OPTION_COMPRESSION_PARAMETERS {
    #StructPack 4

    Tag : UInt32

    Length : UInt16

    Reserved : UInt16

}
