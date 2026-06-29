#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }
#Import ".\KS_TRUECOLORINFO.ahk" { KS_TRUECOLORINFO }
#Import ".\KS_RGBQUAD.ahk" { KS_RGBQUAD }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VIDEOINFO {
    #StructPack 8

    rcSource : RECT

    rcTarget : RECT

    dwBitRate : UInt32

    dwBitErrorRate : UInt32

    AvgTimePerFrame : Int64

    bmiHeader : KS_BITMAPINFOHEADER

    bmiColors : KS_RGBQUAD[256]

    static __New() {
        DefineProp(this.Prototype, 'dwBitMasks', { type: UInt32[3], offset: 88 })
        DefineProp(this.Prototype, 'TrueColorInfo', { type: KS_TRUECOLORINFO, offset: 88 })
        this.DeleteProp("__New")
    }
}
