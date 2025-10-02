#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a type of compressed buffer for decoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_decoder_buffer_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_BUFFER_TYPE{

    /**
     * Picture decoding parameter buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_PICTURE_PARAMETERS => 0

    /**
     * Macroblock control command buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_MACROBLOCK_CONTROL => 1

    /**
     * Residual difference block data buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_RESIDUAL_DIFFERENCE => 2

    /**
     * Deblocking filter control command buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_DEBLOCKING_CONTROL => 3

    /**
     * Inverse quantization matrix buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_INVERSE_QUANTIZATION_MATRIX => 4

    /**
     * Slice-control buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_SLICE_CONTROL => 5

    /**
     * Bitstream data buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_BITSTREAM => 6

    /**
     * Motion vector buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_MOTION_VECTOR => 7

    /**
     * Film grain synthesis data buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_FILM_GRAIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_VIDEO_DECODER_BUFFER_HUFFMAN_TABLE => 9
}
