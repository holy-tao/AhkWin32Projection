#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_RENDER_PIPELINE_STAGE extends Win32Enum {

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_INPUT_ASSEMBLER
     * @type {Integer (Int32)}
     */
    static INPUT_ASSEMBLER => 1

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_VERTEX_SHADER
     * @type {Integer (Int32)}
     */
    static VERTEX_SHADER => 2

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_GEOMETRY_SHADER
     * @type {Integer (Int32)}
     */
    static GEOMETRY_SHADER => 3

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_STREAM_OUTPUT
     * @type {Integer (Int32)}
     */
    static STREAM_OUTPUT => 4

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_RASTERIZER
     * @type {Integer (Int32)}
     */
    static RASTERIZER => 5

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_PIXEL_SHADER
     * @type {Integer (Int32)}
     */
    static PIXEL_SHADER => 6

    /**
     * Native name: DXGK_RENDER_PIPELINE_STAGE_OUTPUT_MERGER
     * @type {Integer (Int32)}
     */
    static OUTPUT_MERGER => 7
}
