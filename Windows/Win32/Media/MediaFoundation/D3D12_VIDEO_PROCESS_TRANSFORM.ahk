#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_PROCESS_ORIENTATION.ahk" { D3D12_VIDEO_PROCESS_ORIENTATION }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Specifies transform parameters for video processing.
 * @remarks
 * For stereo formats, the orientation is applied before the stereo format is applied.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_transform
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_PROCESS_TRANSFORM {
    #StructPack 4

    /**
     * Specifies the source rectangle of the transform. This is the portion of the input surface that is blitted to the destination surface. The source rectangle is given in pixel coordinates, relative to the input surface.
     */
    SourceRectangle : RECT

    /**
     * Specifies the destination rectangle of the transform. This is the portion of the output surface that receives the blit for this stream. The destination rectangle is given in pixel coordinates, relative to the output surface.
     */
    DestinationRectangle : RECT

    /**
     * The rotation and flip operation to apply to the source.  Source and Destination rectangles are specified in post orientation coordinates.
     */
    Orientation : D3D12_VIDEO_PROCESS_ORIENTATION

}
