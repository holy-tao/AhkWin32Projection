#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct READ_LIST {
    #StructPack 8

    FileObject : FILE_OBJECT.Ptr

    NumberOfEntries : UInt32

    IsImage : UInt32

    List : IntPtr[1]

}
