#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_FILE_NAME_INFORMATION {
    #StructPack 8

    Size : UInt16

    NamesParsed : UInt16

    Format : UInt32

    Name : IntPtr

    Volume : IntPtr

    Share : IntPtr

    Extension : IntPtr

    Stream : IntPtr

    FinalComponent : IntPtr

    ParentDir : IntPtr

}
