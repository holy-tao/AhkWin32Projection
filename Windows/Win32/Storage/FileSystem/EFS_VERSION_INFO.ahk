#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_VERSION_INFO {
    #StructPack 4

    EfsVersion : UInt32

    SubVersion : UInt32

}
