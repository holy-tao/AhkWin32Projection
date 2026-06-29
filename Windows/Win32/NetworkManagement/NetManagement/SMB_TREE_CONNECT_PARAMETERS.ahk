#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SMB_TREE_CONNECT_PARAMETERS {
    #StructPack 4

    EABufferOffset : UInt32

    EABufferLen : UInt32

    CreateOptions : UInt32

    TreeConnectAttributes : UInt32

}
