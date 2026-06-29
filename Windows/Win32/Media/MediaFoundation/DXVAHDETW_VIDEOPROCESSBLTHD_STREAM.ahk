#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DXVAHD_FRAME_FORMAT.ahk" { DXVAHD_FRAME_FORMAT }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHDETW_VIDEOPROCESSBLTHD_STREAM {
    #StructPack 8

    pObject : Int64

    pInputSurface : Int64

    SourceRect : RECT

    DestinationRect : RECT

    InputFormat : D3DFORMAT

    FrameFormat : DXVAHD_FRAME_FORMAT

    ColorSpace : UInt32

    StreamNumber : UInt32

    OutputIndex : UInt32

    InputFrameOrField : UInt32

    PastFrames : UInt32

    FutureFrames : UInt32

}
