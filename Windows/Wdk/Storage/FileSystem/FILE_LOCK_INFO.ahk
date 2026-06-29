#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_LOCK_INFO {
    #StructPack 8

    StartingByte : Int64

    Length : Int64

    ExclusiveLock : BOOLEAN

    Key : UInt32

    FileObject : FILE_OBJECT.Ptr

    ProcessId : IntPtr

    EndingByte : Int64

}
