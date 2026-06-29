#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the range of supported sizes for a video scaler.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_size_range
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_SIZE_RANGE {
    #StructPack 4

    /**
     * The largest output width to which content can be scaled.  The largest value allowed is **D3D12\_REQ\_TEXTURE2D\_U\_OR\_V\_DIMENSION** (16384).
     */
    MaxWidth : UInt32

    /**
     * The largest output height to which content can be scaled.  The largest value allowed is **D3D12\_REQ\_TEXTURE2D\_U\_OR\_V\_DIMENSION** (16384).
     */
    MaxHeight : UInt32

    /**
     * The smallest output width to which content can be scaled. The smallest allowed value is 1.
     */
    MinWidth : UInt32

    /**
     * The smallest output height to which content can be scaled. The smallest allowed value is 1.
     */
    MinHeight : UInt32

}
