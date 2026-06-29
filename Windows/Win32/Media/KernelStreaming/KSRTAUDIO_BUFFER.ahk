#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_BUFFER {
    #StructPack 8

    BufferAddress : IntPtr

    ActualBufferSize : UInt32

    CallMemoryBarrier : BOOL

}
