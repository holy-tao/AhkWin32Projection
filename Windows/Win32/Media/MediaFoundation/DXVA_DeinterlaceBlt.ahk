#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_SampleFormat.ahk" { DXVA_SampleFormat }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DXVA_VideoSample.ahk" { DXVA_VideoSample }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_DeinterlaceBlt {
    #StructPack 8

    Size : UInt32

    Reserved : UInt32

    rtTarget : Int64

    DstRect : RECT

    SrcRect : RECT

    NumSourceSurfaces : UInt32

    Alpha : Float32

    Source : DXVA_VideoSample[32]

}
