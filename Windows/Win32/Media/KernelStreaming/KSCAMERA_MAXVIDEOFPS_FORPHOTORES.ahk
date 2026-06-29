#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_MAXVIDEOFPS_FORPHOTORES {
    #StructPack 4

    PhotoResWidth : UInt32

    PhotoResHeight : UInt32

    PreviewFPSNum : UInt32

    PreviewFPSDenom : UInt32

    CaptureFPSNum : UInt32

    CaptureFPSDenom : UInt32

}
