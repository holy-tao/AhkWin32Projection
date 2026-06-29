#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_BUFFER32 {
    #StructPack 4

    BufferAddress : UInt32

    ActualBufferSize : UInt32

    CallMemoryBarrier : BOOL

}
