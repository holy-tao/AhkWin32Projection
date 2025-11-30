#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_RENDER_PIPELINE_STAGE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_INPUT_ASSEMBLER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_VERTEX_SHADER => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_GEOMETRY_SHADER => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_STREAM_OUTPUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_RASTERIZER => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_PIXEL_SHADER => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_RENDER_PIPELINE_STAGE_OUTPUT_MERGER => 7
}
