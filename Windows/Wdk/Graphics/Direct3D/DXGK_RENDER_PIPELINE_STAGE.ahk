#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_RENDER_PIPELINE_STAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
