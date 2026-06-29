#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_AYUVsample2.ahk" { DXVA_AYUVsample2 }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DXVA_VideoSample32.ahk" { DXVA_VideoSample32 }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @architecture X64, Arm64
 */
export default struct DXVA_DeinterlaceBltEx32 {
    #StructPack 8

    Size : UInt32

    BackgroundColor : DXVA_AYUVsample2

    rcTarget : RECT

    rtTarget : Int64

    NumSourceSurfaces : UInt32

    Alpha : Float32

    Source : DXVA_VideoSample32[32]

    DestinationFormat : UInt32

    DestinationFlags : UInt32

}
