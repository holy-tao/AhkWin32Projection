#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_VIDEOSAMPLE.ahk" { DXVA2_VIDEOSAMPLE }
#Import "..\MediaFoundation\DXVA2_FilterValues.ahk" { DXVA2_FilterValues }
#Import "..\MediaFoundation\DXVA2_AYUVSample16.ahk" { DXVA2_AYUVSample16 }
#Import "..\MediaFoundation\DXVA2_Fixed32.ahk" { DXVA2_Fixed32 }
#Import "..\MediaFoundation\DXVA2_ExtendedFormat.ahk" { DXVA2_ExtendedFormat }
#Import "..\MediaFoundation\DXVA2_ProcAmpValues.ahk" { DXVA2_ProcAmpValues }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2_VIDEOPROCESSBLT {
    #StructPack 8

    TargetFrame : Int64

    TargetRect : RECT

    ConstrictionSize : SIZE

    StreamingFlags : UInt32

    BackgroundColor : DXVA2_AYUVSample16

    DestFormat : DXVA2_ExtendedFormat

    DestFlags : UInt32

    ProcAmpValues : DXVA2_ProcAmpValues

    Alpha : DXVA2_Fixed32

    NoiseFilterLuma : DXVA2_FilterValues

    NoiseFilterChroma : DXVA2_FilterValues

    DetailFilterLuma : DXVA2_FilterValues

    DetailFilterChroma : DXVA2_FilterValues

    pSrcSurfaces : DXVA2_VIDEOSAMPLE.Ptr

    NumSrcSurfaces : UInt32

}
