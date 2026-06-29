#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSAUDIOENGINE_BUFFER_SIZE_RANGE {
    #StructPack 4

    MinBufferBytes : UInt32

    MaxBufferBytes : UInt32

}
