#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_DECRYPTION_STATUS_INFO {
    #StructPack 4

    dwDecryptionError : UInt32

    dwHashOffset : UInt32

    cbHash : UInt32

}
