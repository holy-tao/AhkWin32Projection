#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_DECODE_ARGUMENT_TYPE.ahk" { D3D12_VIDEO_DECODE_ARGUMENT_TYPE }

/**
 * Represents the decode parameters for a frame.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_decode_frame_argument
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_DECODE_FRAME_ARGUMENT {
    #StructPack 8

    /**
     * A member of the [D3D12_VIDEO_DECODE_ARGUMENT_TYPE](ne-d3d12video-d3d12_video_decode_argument_type.md) enumeration specifying the type of argument.
     */
    Type : D3D12_VIDEO_DECODE_ARGUMENT_TYPE

    /**
     * The size of the data in *pArgument*, in bytes.
     */
    Size : UInt32

    /**
     * A pointer to the argument data.
     */
    pData : IntPtr

}
