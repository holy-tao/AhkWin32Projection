#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENCRYPTION_PROTECTOR.ahk" { ENCRYPTION_PROTECTOR }

/**
 * Under WIP policy, includes all the identities a file is protected to.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/encryption_protector_list-structure
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTION_PROTECTOR_LIST {
    #StructPack 8

    nProtectors : UInt32

    pProtectors : IntPtr

}
