#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct FILE_NOTIFY_FULL_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    Action : UInt32

    CreationTime : Int64

    LastModificationTime : Int64

    LastChangeTime : Int64

    LastAccessTime : Int64

    AllocatedLength : Int64

    FileSize : Int64

    FileAttributes : UInt32

    ReparsePointTag : UInt32

    FileId : Int64

    ParentFileId : Int64

    FileNameLength : UInt16

    FileNameFlags : Int8

    Reserved : Int8

    FileName : WCHAR[1]

    static __New() {
        DefineProp(this.Prototype, 'EaSize', { type: UInt32, offset: 60 })
        this.DeleteProp("__New")
    }
}
