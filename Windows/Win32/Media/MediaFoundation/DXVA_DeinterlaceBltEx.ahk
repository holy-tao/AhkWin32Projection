#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_AYUVsample2.ahk" { DXVA_AYUVsample2 }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DXVA_VideoSample2.ahk" { DXVA_VideoSample2 }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_DeinterlaceBltEx {
    #StructPack 8

    Size : UInt32

    BackgroundColor : DXVA_AYUVsample2

    rcTarget : RECT

    rtTarget : Int64

    NumSourceSurfaces : UInt32

    Alpha : Float32

    Source : DXVA_VideoSample2[32]

    DestinationFormat : UInt32

    DestinationFlags : UInt32

}
