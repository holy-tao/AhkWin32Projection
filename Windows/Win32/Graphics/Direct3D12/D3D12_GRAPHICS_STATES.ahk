#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that specify states related to a graphics command list. Values can be bitwise OR'd together.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_graphics_states
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GRAPHICS_STATES{

    /**
     * Specifies no state.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_NONE => 0

    /**
     * Specifies the state of the vertex buffer bindings on the input assembler stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_IA_VERTEX_BUFFERS => 1

    /**
     * Specifies the state of the index buffer binding on the input assembler stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_IA_INDEX_BUFFER => 2

    /**
     * Specifies the state of the primitive topology value set on the input assembler stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_IA_PRIMITIVE_TOPOLOGY => 4

    /**
     * Specifies the state of the currently bound descriptor heaps.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_DESCRIPTOR_HEAP => 8

    /**
     * Specifies the state of the currently set graphics root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_GRAPHICS_ROOT_SIGNATURE => 16

    /**
     * Specifies the state of the currently set compute root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_COMPUTE_ROOT_SIGNATURE => 32

    /**
     * Specifies the state of the viewports bound to the rasterizer stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_RS_VIEWPORTS => 64

    /**
     * Specifies the state of the scissor rectangles bound to the rasterizer stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_RS_SCISSOR_RECTS => 128

    /**
     * Specifies the predicate state.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_PREDICATION => 256

    /**
     * Specifies the state of the render targets bound to the output merger stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_OM_RENDER_TARGETS => 512

    /**
     * Specifies the state of the reference value for depth stencil tests set on the output merger stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_OM_STENCIL_REF => 1024

    /**
     * Specifies the state of the blend factor set on the output merger stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_OM_BLEND_FACTOR => 2048

    /**
     * Specifies the state of the pipeline state object.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_PIPELINE_STATE => 4096

    /**
     * Specifies the state of the buffer views bound to the stream output stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_SO_TARGETS => 8192

    /**
     * Specifies the state of the depth bounds set on the output merger stage.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_OM_DEPTH_BOUNDS => 16384

    /**
     * Specifies the state of the sample positions.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_SAMPLE_POSITIONS => 32768

    /**
     * Specifies the state of the view instances mask.
     * @type {Integer (Int32)}
     */
    static D3D12_GRAPHICS_STATE_VIEW_INSTANCE_MASK => 65536
}
