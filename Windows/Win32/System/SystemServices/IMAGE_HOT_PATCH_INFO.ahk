#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_HOT_PATCH_INFO {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    SequenceNumber : UInt32

    BaseImageList : UInt32

    BaseImageCount : UInt32

    BufferOffset : UInt32

    ExtraPatchSize : UInt32

    MinSequenceNumber : UInt32

    Flags : UInt32

}
