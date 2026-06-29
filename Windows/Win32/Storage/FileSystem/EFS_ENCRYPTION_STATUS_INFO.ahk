#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct EFS_ENCRYPTION_STATUS_INFO {
    #StructPack 4

    bHasCurrentKey : BOOL

    dwEncryptionError : UInt32

}
