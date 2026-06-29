#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSWAVE_BUFFER {
    #StructPack 8

    Attributes : UInt32

    BufferSize : UInt32

    BufferAddress : IntPtr

}
