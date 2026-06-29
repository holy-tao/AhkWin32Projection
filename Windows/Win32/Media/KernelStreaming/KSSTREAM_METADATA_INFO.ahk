#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTREAM_METADATA_INFO {
    #StructPack 8

    BufferSize : UInt32

    UsedSize : UInt32

    Data : IntPtr

    SystemVa : IntPtr

    Flags : UInt32

    Reserved : UInt32

}
