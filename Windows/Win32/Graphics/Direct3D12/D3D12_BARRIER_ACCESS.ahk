#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BARRIER_ACCESS{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_COMMON => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VERTEX_BUFFER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_CONSTANT_BUFFER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_INDEX_BUFFER => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_RENDER_TARGET => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_UNORDERED_ACCESS => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_DEPTH_STENCIL_WRITE => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_DEPTH_STENCIL_READ => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_SHADER_RESOURCE => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_STREAM_OUTPUT => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_INDIRECT_ARGUMENT => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_PREDICATION => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_COPY_DEST => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_COPY_SOURCE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_RESOLVE_DEST => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_RESOLVE_SOURCE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_RAYTRACING_ACCELERATION_STRUCTURE_READ => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_RAYTRACING_ACCELERATION_STRUCTURE_WRITE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_SHADING_RATE_SOURCE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VIDEO_DECODE_READ => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VIDEO_DECODE_WRITE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VIDEO_PROCESS_READ => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VIDEO_PROCESS_WRITE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VIDEO_ENCODE_READ => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_VIDEO_ENCODE_WRITE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_ACCESS_NO_ACCESS => -2147483648
}
