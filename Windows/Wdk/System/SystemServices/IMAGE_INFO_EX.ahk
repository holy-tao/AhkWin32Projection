#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IMAGE_INFO_EX {
    #StructPack 8

    Size : IntPtr

    ImageInfo : IntPtr

    FileObject : FILE_OBJECT.Ptr

}
