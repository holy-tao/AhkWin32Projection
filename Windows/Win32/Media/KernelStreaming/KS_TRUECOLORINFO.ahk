#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_RGBQUAD.ahk" { KS_RGBQUAD }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_TRUECOLORINFO {
    #StructPack 4

    dwBitMasks : UInt32[3]

    bmiColors : KS_RGBQUAD[256]

}
