#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSALLOCATOR_FRAMING.ahk" { KSALLOCATOR_FRAMING }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSSTREAMALLOCATOR_STATUS {
    #StructPack 4

    Framing : KSALLOCATOR_FRAMING

    AllocatedFrames : UInt32

    Reserved : UInt32

}
