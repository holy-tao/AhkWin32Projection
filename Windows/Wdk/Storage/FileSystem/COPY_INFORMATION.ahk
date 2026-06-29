#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct COPY_INFORMATION {
    #StructPack 8

    SourceFileObject : FILE_OBJECT.Ptr

    SourceFileOffset : Int64

}
