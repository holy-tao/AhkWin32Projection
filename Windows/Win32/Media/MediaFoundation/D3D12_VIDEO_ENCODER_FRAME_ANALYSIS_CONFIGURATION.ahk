#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_FRAME_ANALYSIS_CONFIGURATION {
    #StructPack 4

    Enabled : BOOL

    Pow2DownscaleFactor : UInt32

}
