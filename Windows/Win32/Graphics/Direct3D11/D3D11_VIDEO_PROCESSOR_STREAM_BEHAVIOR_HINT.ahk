#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides information about the input streams passed into the ID3DVideoContext1::VideoProcessorGetBehaviorHints method.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_processor_stream_behavior_hint
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT {
    #StructPack 4

    /**
     * A value indicating whether this input stream should be used to compute behavior hints. Set to true if the stream should be used to compute behavior hints; otherwise, set to false.
     */
    Enable : BOOL

    /**
     * The width of the input stream.
     */
    Width : UInt32

    /**
     * The height of the input stream.
     */
    Height : UInt32

    /**
     * The format of the input stream.
     */
    Format : DXGI_FORMAT

}
