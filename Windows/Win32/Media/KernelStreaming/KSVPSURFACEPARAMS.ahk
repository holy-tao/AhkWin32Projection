#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSVPSURFACEPARAMS {
    #StructPack 4

    dwPitch : UInt32

    dwXOrigin : UInt32

    dwYOrigin : UInt32

}
