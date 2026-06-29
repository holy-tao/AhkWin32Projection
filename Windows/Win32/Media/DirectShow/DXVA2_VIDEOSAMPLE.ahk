#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\MediaFoundation\DXVA2_AYUVSample8.ahk" { DXVA2_AYUVSample8 }
#Import "..\MediaFoundation\DXVA2_ExtendedFormat.ahk" { DXVA2_ExtendedFormat }
#Import "..\MediaFoundation\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2_VIDEOSAMPLE {
    #StructPack 8

    Start : Int64

    End : Int64

    SampleFormat : DXVA2_ExtendedFormat

    SampleFlags : UInt32

    SrcResource : IntPtr

    SrcRect : RECT

    DstRect : RECT

    Pal : DXVA2_AYUVSample8[16]

    PlanarAlpha : DXVA2_Fixed32

}
