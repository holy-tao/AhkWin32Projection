#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSMIDILOOPED_BUFFER {
    #StructPack 8

    BufferAddress : IntPtr

    ActualBufferSize : UInt32

}
