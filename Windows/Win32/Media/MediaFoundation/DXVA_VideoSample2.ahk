#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_AYUVsample2.ahk" { DXVA_AYUVsample2 }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @architecture X64, Arm64
 */
export default struct DXVA_VideoSample2 {
    #StructPack 8

    Size : UInt32

    Reserved : UInt32

    rtStart : Int64

    rtEnd : Int64

    SampleFormat : UInt32

    SampleFlags : UInt32

    lpDDSSrcSurface : IntPtr

    rcSrc : RECT

    rcDst : RECT

    Palette : DXVA_AYUVsample2[16]

}
