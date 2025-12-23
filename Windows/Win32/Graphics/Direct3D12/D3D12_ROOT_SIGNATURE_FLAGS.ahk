#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies options for root signature layout.
 * @remarks
 * This enum is used in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> structure.
 *       
 * 
 * The value in denying access to shader stages is a minor optimization on some hardware. If, for example, the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_shader_visibility">D3D12_SHADER_VISIBILITY_ALL</a> flag has been set to broadcast the root signature to all shader stages, then denying access can overrule this and save the hardware some work. Alternatively if the shader is so simple that no root signature resources are needed, then denying access could be used here too.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_root_signature_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_SIGNATURE_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates default behavior.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_NONE => 0

    /**
     * The app is opting in to using the Input Assembler (requiring an input layout that defines a set of vertex buffer bindings). Omitting this flag can result in one root argument space being saved on some hardware. Omit this flag if the Input Assembler is not required, though the optimization is minor.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT => 1

    /**
     * Denies the vertex shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_VERTEX_SHADER_ROOT_ACCESS => 2

    /**
     * Denies the hull shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_HULL_SHADER_ROOT_ACCESS => 4

    /**
     * Denies the domain shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_DOMAIN_SHADER_ROOT_ACCESS => 8

    /**
     * Denies the geometry shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_GEOMETRY_SHADER_ROOT_ACCESS => 16

    /**
     * Denies the pixel shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_PIXEL_SHADER_ROOT_ACCESS => 32

    /**
     * The app is opting in to using Stream Output. Omitting this flag can result in one root argument space being saved on some hardware. Omit this flag if Stream Output is not required, though the optimization is minor.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_ALLOW_STREAM_OUTPUT => 64

    /**
     * The root signature is to be used with raytracing shaders to define resource bindings sourced from shader records in shader tables.  This flag cannot be combined with any other root signature flags, which are all related to the graphics pipeline.  The absence of the flag means the root signature can be used with graphics or compute, where the compute version is also shared with raytracing’s global root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_LOCAL_ROOT_SIGNATURE => 128

    /**
     * Denies the amplification shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_AMPLIFICATION_SHADER_ROOT_ACCESS => 256

    /**
     * Denies the mesh shader access to the root signature.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_DENY_MESH_SHADER_ROOT_ACCESS => 512

    /**
     * The shaders are allowed to index the CBV/SRV/UAV descriptor heap directly, using the *ResourceDescriptorHeap* built-in variable.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_CBV_SRV_UAV_HEAP_DIRECTLY_INDEXED => 1024

    /**
     * The shaders are allowed to index the sampler descriptor heap directly, using the *SamplerDescriptorHeap* built-in variable.
     * @type {Integer (Int32)}
     */
    static D3D12_ROOT_SIGNATURE_FLAG_SAMPLER_HEAP_DIRECTLY_INDEXED => 2048
}
