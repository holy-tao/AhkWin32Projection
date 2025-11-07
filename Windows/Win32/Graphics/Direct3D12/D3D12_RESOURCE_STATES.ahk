#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the state of a resource regarding how the resource is being used.
 * @remarks
 * 
 *         This enum is used by the following methods:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommittedresource">CreateCommittedResource</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createreservedresource">CreateReservedResource</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_resource_states
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_STATES{

    /**
     * Your application should transition to this state only for accessing a resource across different graphics engine types.
 * 
 * Specifically, a resource must be in the COMMON state before being used on a COPY queue (when previous used on DIRECT/COMPUTE), and before being used on DIRECT/COMPUTE (when previously used on COPY). This restriction does not exist when accessing data between DIRECT and COMPUTE queues.
 * 
 * The COMMON state can be used for all usages on a Copy queue using the implicit state transitions. For more info, in <a href="https://docs.microsoft.com/windows/win32/direct3d12/user-mode-heap-synchronization">Multi-engine synchronization</a>, find "common".          
 * 
 * Additionally, textures must be in the COMMON state for CPU access to be legal, assuming the texture was created in a CPU-visible heap in the first place.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_COMMON => 0

    /**
     * A subresource must be in this state when it is accessed by the GPU as a vertex buffer or constant buffer. This is a read-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VERTEX_AND_CONSTANT_BUFFER => 1

    /**
     * A subresource must be in this state when it is accessed by the 3D pipeline as an index buffer. This is a read-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_INDEX_BUFFER => 2

    /**
     * The resource is used as a render target. A subresource must be in this state when it is rendered to or when it is cleared with <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearrendertargetview">ID3D12GraphicsCommandList::ClearRenderTargetView</a>.
 * 
 * This is a write-only state. To read from a render target as a shader resource the resource must be in either  D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE or D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RENDER_TARGET => 4

    /**
     * The resource is used for unordered access. A subresource must be in this state when it is accessed by the GPU via an unordered access view. A subresource must also be in this state when it is cleared with <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewuint">ID3D12GraphicsCommandList::ClearUnorderedAccessViewInt</a> or <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewfloat">ID3D12GraphicsCommandList::ClearUnorderedAccessViewFloat</a>. This is a read/write state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_UNORDERED_ACCESS => 8

    /**
     * **D3D12_RESOURCE_STATE_DEPTH_WRITE** is a state that is mutually exclusive with other states. You should use it for <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-cleardepthstencilview">ID3D12GraphicsCommandList::ClearDepthStencilView</a> when the flags (see <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_clear_flags">D3D12_CLEAR_FLAGS</a>) indicate a given subresource should be cleared (otherwise the subresource state doesn't matter), or when using it in a writable depth stencil view (see <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dsv_flags">D3D12_DSV_FLAGS</a>) when the PSO has depth write enabled (see <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a>).
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_DEPTH_WRITE => 16

    /**
     * DEPTH_READ is a state which can be combined with other states. It should be used when the subresource is in a read-only depth stencil view, or when the <i>DepthEnable</i> parameter of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc">D3D12_DEPTH_STENCIL_DESC</a> is false. It can be combined with other read states (for example, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE), such that the resource can be used for the depth or stencil test, and accessed by a shader within the same draw call. Using it when depth will be written by a draw call or clear command is invalid.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_DEPTH_READ => 32

    /**
     * The resource is used with a shader other than the pixel shader. A subresource must be in this state before being read by any stage (except for the pixel shader stage) via a shader resource view. You can still use the resource in a pixel shader with this flag as long as it also has the flag D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE set. This is a read-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_NON_PIXEL_SHADER_RESOURCE => 64

    /**
     * The resource is used with a pixel shader. A subresource must be in this state before being read by the pixel shader via a shader resource view. This is a read-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE => 128

    /**
     * The resource is used with stream output. A subresource must be in this state when it is accessed by the 3D pipeline as a stream-out target. This is a write-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_STREAM_OUT => 256

    /**
     * The resource is used as an indirect argument.
 *             Subresources must be in this state when they are used as the argument buffer passed to the indirect drawing method <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-executeindirect">ID3D12GraphicsCommandList::ExecuteIndirect</a>.
 *             This is a read-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_INDIRECT_ARGUMENT => 512

    /**
     * The resource is used as the destination in a copy operation.
 *             Subresources must be in this state when they are used as the destination of copy operation, or a blt operation.
 *             This is a write-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_COPY_DEST => 1024

    /**
     * The resource is used as the source in a copy operation.
 *             Subresources must be in this state when they are used as the source of copy operation, or a blt operation.
 *             This is a read-only state.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_COPY_SOURCE => 2048

    /**
     * The resource is used as the destination in a resolve operation.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESOLVE_DEST => 4096

    /**
     * The resource is used as the source in a resolve operation.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESOLVE_SOURCE => 8192

    /**
     * When a buffer is created with this as its initial state, it indicates that the resource is a raytracing acceleration structure, for use in <a href="nf-d3d12-id3d12graphicscommandlist4-buildraytracingaccelerationstructure.md">ID3D12GraphicsCommandList4::BuildRaytracingAccelerationStructure</a>, <a href="nf-d3d12-id3d12graphicscommandlist4-copyraytracingaccelerationstructure.md">ID3D12GraphicsCommandList4::CopyRaytracingAccelerationStructure</a>, or <a href="nf-d3d12-id3d12device-createshaderresourceview.md">ID3D12Device::CreateShaderResourceView</a> for the <a href="ne-d3d12-d3d12_srv_dimension.md">D3D12_SRV_DIMENSION_RAYTRACING_ACCELERATION_STRUCTURE</a> dimension.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RAYTRACING_ACCELERATION_STRUCTURE => 4194304

    /**
     * Starting with Windows 10, version 1903 (10.0; Build 18362), indicates that the resource is a screen-space shading-rate image for variable-rate shading (VRS). For more info, see <a href="https://docs.microsoft.com/windows/win32/direct3d12/vrs">Variable-rate shading (VRS)</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_SHADING_RATE_SOURCE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESERVED_INTERNAL_8000 => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESERVED_INTERNAL_4000 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESERVED_INTERNAL_100000 => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESERVED_INTERNAL_40000000 => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_RESERVED_INTERNAL_80000000 => -2147483648

    /**
     * D3D12_RESOURCE_STATE_GENERIC_READ is a logically OR'd combination of other read-state bits. This is the required starting state for an upload heap. Your application should generally avoid transitioning to D3D12_RESOURCE_STATE_GENERIC_READ when possible, since that can result in premature cache flushes, or resource layout changes (for example, compress/decompress), causing unnecessary pipeline stalls. You should instead transition resources only to the actually-used states.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_GENERIC_READ => 2755

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_ALL_SHADER_RESOURCE => 192

    /**
     * Synonymous with D3D12_RESOURCE_STATE_COMMON.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_PRESENT => 0

    /**
     * The resource is used for <a href="https://docs.microsoft.com/windows/win32/direct3d12/predication">Predication</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_PREDICATION => 512

    /**
     * The resource is used as a source in a decode operation. Examples include reading the compressed bitstream and reading from decode references,
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VIDEO_DECODE_READ => 65536

    /**
     * The resource is used as a destination in the decode operation. This state is used for decode output and histograms.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VIDEO_DECODE_WRITE => 131072

    /**
     * The resource is used to read video data during video processing; that is, the resource is used as the source in a processing operation such as video encoding (compression).
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VIDEO_PROCESS_READ => 262144

    /**
     * The resource is used to write video data during video processing; that is, the resource is used as the destination in a processing operation such as video encoding (compression).
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VIDEO_PROCESS_WRITE => 524288

    /**
     * The resource is used as the source in an encode operation. This state is used for the input and reference of motion estimation.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VIDEO_ENCODE_READ => 2097152

    /**
     * This resource is used as the destination in an encode operation. This state is used for the destination texture of a resolve motion vector heap operation.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_STATE_VIDEO_ENCODE_WRITE => 8388608
}
