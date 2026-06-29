#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_FOEXT_SHADOW_FILE {
    #StructPack 8

    BackingFileObject : FILE_OBJECT.Ptr

    BackingFltInstance : IntPtr

}
