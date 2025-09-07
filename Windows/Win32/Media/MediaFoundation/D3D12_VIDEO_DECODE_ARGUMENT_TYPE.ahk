#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the argument type of a D3D12_VIDEO_DECODE_FRAME_ARGUMENT
 * @remarks
 * The values used with the argument type are defined by the DXVA specification for a given codec.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_decode_argument_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_ARGUMENT_TYPE{

    /**
     * The argument is a picture decoding parameter buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_ARGUMENT_TYPE_PICTURE_PARAMETERS => 0

    /**
     * The argument is an inverse quantization matrix buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_ARGUMENT_TYPE_INVERSE_QUANTIZATION_MATRIX => 1

    /**
     * The argument is a slice control buffer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_ARGUMENT_TYPE_SLICE_CONTROL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_ARGUMENT_TYPE_HUFFMAN_TABLE => 3
}
