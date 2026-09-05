#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of compressed buffer for decoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_decoder_buffer_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_VIDEO_DECODER_BUFFER_TYPE extends Win32Enum {

    /**
     * Picture decoding parameter buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_PICTURE_PARAMETERS
     * @type {Integer (Int32)}
     */
    static PICTURE_PARAMETERS => 0

    /**
     * Macroblock control command buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_MACROBLOCK_CONTROL
     * @type {Integer (Int32)}
     */
    static MACROBLOCK_CONTROL => 1

    /**
     * Residual difference block data buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_RESIDUAL_DIFFERENCE
     * @type {Integer (Int32)}
     */
    static RESIDUAL_DIFFERENCE => 2

    /**
     * Deblocking filter control command buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_DEBLOCKING_CONTROL
     * @type {Integer (Int32)}
     */
    static DEBLOCKING_CONTROL => 3

    /**
     * Inverse quantization matrix buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_INVERSE_QUANTIZATION_MATRIX
     * @type {Integer (Int32)}
     */
    static INVERSE_QUANTIZATION_MATRIX => 4

    /**
     * Slice-control buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_SLICE_CONTROL
     * @type {Integer (Int32)}
     */
    static SLICE_CONTROL => 5

    /**
     * Bitstream data buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_BITSTREAM
     * @type {Integer (Int32)}
     */
    static BITSTREAM => 6

    /**
     * Motion vector buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_MOTION_VECTOR
     * @type {Integer (Int32)}
     */
    static MOTION_VECTOR => 7

    /**
     * Film grain synthesis data buffer.
     * Native name: D3D11_VIDEO_DECODER_BUFFER_FILM_GRAIN
     * @type {Integer (Int32)}
     */
    static FILM_GRAIN => 8

    /**
     * Native name: D3D11_VIDEO_DECODER_BUFFER_HUFFMAN_TABLE
     * @type {Integer (Int32)}
     */
    static HUFFMAN_TABLE => 9
}
