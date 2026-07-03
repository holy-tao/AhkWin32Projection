#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_OPERATION_REGISTRATION {
    #StructPack 8

    MajorFunction : Int8

    Flags : UInt32

    PreOperation : IntPtr

    PostOperation : IntPtr

    Reserved1 : IntPtr

}
