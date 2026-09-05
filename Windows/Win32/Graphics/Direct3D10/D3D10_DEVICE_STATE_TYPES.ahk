#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Effect device-state types.
 * @remarks
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskdisablecapture">D3D10StateBlockMaskDisableCapture</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskenablecapture">D3D10StateBlockMaskEnableCapture</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-d3d10stateblockmaskgetsetting">D3D10StateBlockMaskGetSetting</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_DEVICE_STATE_TYPES extends Win32Enum {

    /**
     * Stream-output buffer.
     * Native name: D3D10_DST_SO_BUFFERS
     * @type {Integer (Int32)}
     */
    static DST_SO_BUFFERS => 1

    /**
     * Render target.
     * Native name: D3D10_DST_OM_RENDER_TARGETS
     * @type {Integer (Int32)}
     */
    static DST_OM_RENDER_TARGETS => 2

    /**
     * Depth-stencil state.
     * Native name: D3D10_DST_OM_DEPTH_STENCIL_STATE
     * @type {Integer (Int32)}
     */
    static DST_OM_DEPTH_STENCIL_STATE => 3

    /**
     * Blend state.
     * Native name: D3D10_DST_OM_BLEND_STATE
     * @type {Integer (Int32)}
     */
    static DST_OM_BLEND_STATE => 4

    /**
     * Vertex shader.
     * Native name: D3D10_DST_VS
     * @type {Integer (Int32)}
     */
    static DST_VS => 5

    /**
     * Vertex shader sampler.
     * Native name: D3D10_DST_VS_SAMPLERS
     * @type {Integer (Int32)}
     */
    static DST_VS_SAMPLERS => 6

    /**
     * Vertex shader resource.
     * Native name: D3D10_DST_VS_SHADER_RESOURCES
     * @type {Integer (Int32)}
     */
    static DST_VS_SHADER_RESOURCES => 7

    /**
     * Vertex shader constant buffer.
     * Native name: D3D10_DST_VS_CONSTANT_BUFFERS
     * @type {Integer (Int32)}
     */
    static DST_VS_CONSTANT_BUFFERS => 8

    /**
     * Geometry shader.
     * Native name: D3D10_DST_GS
     * @type {Integer (Int32)}
     */
    static DST_GS => 9

    /**
     * Geometry shader sampler.
     * Native name: D3D10_DST_GS_SAMPLERS
     * @type {Integer (Int32)}
     */
    static DST_GS_SAMPLERS => 10

    /**
     * Geometry shader resource.
     * Native name: D3D10_DST_GS_SHADER_RESOURCES
     * @type {Integer (Int32)}
     */
    static DST_GS_SHADER_RESOURCES => 11

    /**
     * Geometry shader constant buffer.
     * Native name: D3D10_DST_GS_CONSTANT_BUFFERS
     * @type {Integer (Int32)}
     */
    static DST_GS_CONSTANT_BUFFERS => 12

    /**
     * Pixel shader.
     * Native name: D3D10_DST_PS
     * @type {Integer (Int32)}
     */
    static DST_PS => 13

    /**
     * Pixel shader sampler.
     * Native name: D3D10_DST_PS_SAMPLERS
     * @type {Integer (Int32)}
     */
    static DST_PS_SAMPLERS => 14

    /**
     * Pixel shader resource.
     * Native name: D3D10_DST_PS_SHADER_RESOURCES
     * @type {Integer (Int32)}
     */
    static DST_PS_SHADER_RESOURCES => 15

    /**
     * Pixel shader constant buffer.
     * Native name: D3D10_DST_PS_CONSTANT_BUFFERS
     * @type {Integer (Int32)}
     */
    static DST_PS_CONSTANT_BUFFERS => 16

    /**
     * Input-assembler vertex buffer.
     * Native name: D3D10_DST_IA_VERTEX_BUFFERS
     * @type {Integer (Int32)}
     */
    static DST_IA_VERTEX_BUFFERS => 17

    /**
     * Input-assembler index buffer.
     * Native name: D3D10_DST_IA_INDEX_BUFFER
     * @type {Integer (Int32)}
     */
    static DST_IA_INDEX_BUFFER => 18

    /**
     * Input-assembler input layout.
     * Native name: D3D10_DST_IA_INPUT_LAYOUT
     * @type {Integer (Int32)}
     */
    static DST_IA_INPUT_LAYOUT => 19

    /**
     * Input-assembler primitive topology.
     * Native name: D3D10_DST_IA_PRIMITIVE_TOPOLOGY
     * @type {Integer (Int32)}
     */
    static DST_IA_PRIMITIVE_TOPOLOGY => 20

    /**
     * Viewport.
     * Native name: D3D10_DST_RS_VIEWPORTS
     * @type {Integer (Int32)}
     */
    static DST_RS_VIEWPORTS => 21

    /**
     * Scissor rectangle.
     * Native name: D3D10_DST_RS_SCISSOR_RECTS
     * @type {Integer (Int32)}
     */
    static DST_RS_SCISSOR_RECTS => 22

    /**
     * Rasterizer state.
     * Native name: D3D10_DST_RS_RASTERIZER_STATE
     * @type {Integer (Int32)}
     */
    static DST_RS_RASTERIZER_STATE => 23

    /**
     * Predication state.
     * Native name: D3D10_DST_PREDICATION
     * @type {Integer (Int32)}
     */
    static DST_PREDICATION => 24
}
