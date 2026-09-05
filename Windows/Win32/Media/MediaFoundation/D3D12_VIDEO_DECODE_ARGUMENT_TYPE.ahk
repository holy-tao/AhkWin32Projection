#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the argument type of a D3D12_VIDEO_DECODE_FRAME_ARGUMENT
 * @remarks
 * The values used with the argument type are defined by the DXVA specification for a given codec.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_decode_argument_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_DECODE_ARGUMENT_TYPE extends Win32Enum {

    /**
     * The argument is a picture decoding parameter buffer.
     * Native name: D3D12_VIDEO_DECODE_ARGUMENT_TYPE_PICTURE_PARAMETERS
     * @type {Integer (Int32)}
     */
    static PICTURE_PARAMETERS => 0

    /**
     * The argument is an inverse quantization matrix buffer.
     * Native name: D3D12_VIDEO_DECODE_ARGUMENT_TYPE_INVERSE_QUANTIZATION_MATRIX
     * @type {Integer (Int32)}
     */
    static INVERSE_QUANTIZATION_MATRIX => 1

    /**
     * The argument is a slice control buffer.
     * Native name: D3D12_VIDEO_DECODE_ARGUMENT_TYPE_SLICE_CONTROL
     * @type {Integer (Int32)}
     */
    static SLICE_CONTROL => 2

    /**
     * Native name: D3D12_VIDEO_DECODE_ARGUMENT_TYPE_HUFFMAN_TABLE
     * @type {Integer (Int32)}
     */
    static HUFFMAN_TABLE => 3
}
