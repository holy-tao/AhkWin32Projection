#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_AMVPSIZE.ahk" { KS_AMVPSIZE }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSVPMAXPIXELRATE {
    #StructPack 4

    Size : KS_AMVPSIZE

    MaxPixelsPerSecond : UInt32

    Reserved : UInt32

}
