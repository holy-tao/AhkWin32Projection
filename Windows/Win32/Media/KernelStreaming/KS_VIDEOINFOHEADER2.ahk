#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\KS_BITMAPINFOHEADER.ahk" { KS_BITMAPINFOHEADER }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VIDEOINFOHEADER2 {
    #StructPack 8

    rcSource : RECT

    rcTarget : RECT

    dwBitRate : UInt32

    dwBitErrorRate : UInt32

    AvgTimePerFrame : Int64

    dwInterlaceFlags : UInt32

    dwCopyProtectFlags : UInt32

    dwPictAspectRatioX : UInt32

    dwPictAspectRatioY : UInt32

    dwControlFlags : UInt32

    dwReserved2 : UInt32

    bmiHeader : KS_BITMAPINFOHEADER

    static __New() {
        DefineProp(this.Prototype, 'dwReserved1', { type: UInt32, offset: 64 })
        this.DeleteProp("__New")
    }
}
