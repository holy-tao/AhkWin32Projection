#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_RENAME_INFORMATION {
    #StructPack 8

    ReplaceIfExists : BOOLEAN

    RootDirectory : HANDLE

    FileNameLength : UInt32

    FileName : WCHAR[1]

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
