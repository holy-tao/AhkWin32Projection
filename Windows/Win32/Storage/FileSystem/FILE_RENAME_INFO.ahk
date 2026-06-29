#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains the name to which the file should be renamed.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_rename_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_RENAME_INFO {
    #StructPack 8

    ReplaceIfExists : BOOLEAN

    /**
     * This field should be set to NULL.
     */
    RootDirectory : HANDLE

    /**
     * The size of **FileName** in bytes, not including the NUL-termination.
     */
    FileNameLength : UInt32

    /**
     * A NUL-terminated wide-character string containing the new path to the file. The value can be one of the following:
     * 
     * - An absolute path (drive, directory, and filename).
     * - A path relative to the process's current directory.
     * - The new name of an NTFS file stream, starting with `:`.
     */
    FileName : WCHAR[1]

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
