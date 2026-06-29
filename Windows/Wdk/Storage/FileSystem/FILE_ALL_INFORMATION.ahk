#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_ALL_INFORMATION {
    #StructPack 8

    BasicInformation : IntPtr

    StandardInformation : IntPtr

    InternalInformation : IntPtr

    EaInformation : IntPtr

    AccessInformation : IntPtr

    PositionInformation : IntPtr

    ModeInformation : IntPtr

    AlignmentInformation : IntPtr

    NameInformation : IntPtr

}
