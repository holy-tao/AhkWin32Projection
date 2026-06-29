#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSRTL_AUXILIARY_BUFFER {
    #StructPack 8

    Buffer : IntPtr

    Length : UInt32

    Flags : UInt32

    Mdl : MDL.Ptr

}
