#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_RPC_BLOB {
    #StructPack 8

    cbData : UInt32

    pbData : IntPtr

}
