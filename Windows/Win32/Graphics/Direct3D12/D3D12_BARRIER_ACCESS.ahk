#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_BARRIER_ACCESS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_BARRIER_ACCESS_COMMON
     * @type {Integer (Int32)}
     */
    static COMMON => 0

    /**
     * Native name: D3D12_BARRIER_ACCESS_VERTEX_BUFFER
     * @type {Integer (Int32)}
     */
    static VERTEX_BUFFER => 1

    /**
     * Native name: D3D12_BARRIER_ACCESS_CONSTANT_BUFFER
     * @type {Integer (Int32)}
     */
    static CONSTANT_BUFFER => 2

    /**
     * Native name: D3D12_BARRIER_ACCESS_INDEX_BUFFER
     * @type {Integer (Int32)}
     */
    static INDEX_BUFFER => 4

    /**
     * Native name: D3D12_BARRIER_ACCESS_RENDER_TARGET
     * @type {Integer (Int32)}
     */
    static RENDER_TARGET => 8

    /**
     * Native name: D3D12_BARRIER_ACCESS_UNORDERED_ACCESS
     * @type {Integer (Int32)}
     */
    static UNORDERED_ACCESS => 16

    /**
     * Native name: D3D12_BARRIER_ACCESS_DEPTH_STENCIL_WRITE
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL_WRITE => 32

    /**
     * Native name: D3D12_BARRIER_ACCESS_DEPTH_STENCIL_READ
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL_READ => 64

    /**
     * Native name: D3D12_BARRIER_ACCESS_SHADER_RESOURCE
     * @type {Integer (Int32)}
     */
    static SHADER_RESOURCE => 128

    /**
     * Native name: D3D12_BARRIER_ACCESS_STREAM_OUTPUT
     * @type {Integer (Int32)}
     */
    static STREAM_OUTPUT => 256

    /**
     * Native name: D3D12_BARRIER_ACCESS_INDIRECT_ARGUMENT
     * @type {Integer (Int32)}
     */
    static INDIRECT_ARGUMENT => 512

    /**
     * Native name: D3D12_BARRIER_ACCESS_PREDICATION
     * @type {Integer (Int32)}
     */
    static PREDICATION => 512

    /**
     * Native name: D3D12_BARRIER_ACCESS_COPY_DEST
     * @type {Integer (Int32)}
     */
    static COPY_DEST => 1024

    /**
     * Native name: D3D12_BARRIER_ACCESS_COPY_SOURCE
     * @type {Integer (Int32)}
     */
    static COPY_SOURCE => 2048

    /**
     * Native name: D3D12_BARRIER_ACCESS_RESOLVE_DEST
     * @type {Integer (Int32)}
     */
    static RESOLVE_DEST => 4096

    /**
     * Native name: D3D12_BARRIER_ACCESS_RESOLVE_SOURCE
     * @type {Integer (Int32)}
     */
    static RESOLVE_SOURCE => 8192

    /**
     * Native name: D3D12_BARRIER_ACCESS_RAYTRACING_ACCELERATION_STRUCTURE_READ
     * @type {Integer (Int32)}
     */
    static RAYTRACING_ACCELERATION_STRUCTURE_READ => 16384

    /**
     * Native name: D3D12_BARRIER_ACCESS_RAYTRACING_ACCELERATION_STRUCTURE_WRITE
     * @type {Integer (Int32)}
     */
    static RAYTRACING_ACCELERATION_STRUCTURE_WRITE => 32768

    /**
     * Native name: D3D12_BARRIER_ACCESS_SHADING_RATE_SOURCE
     * @type {Integer (Int32)}
     */
    static SHADING_RATE_SOURCE => 65536

    /**
     * Native name: D3D12_BARRIER_ACCESS_VIDEO_DECODE_READ
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODE_READ => 131072

    /**
     * Native name: D3D12_BARRIER_ACCESS_VIDEO_DECODE_WRITE
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODE_WRITE => 262144

    /**
     * Native name: D3D12_BARRIER_ACCESS_VIDEO_PROCESS_READ
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESS_READ => 524288

    /**
     * Native name: D3D12_BARRIER_ACCESS_VIDEO_PROCESS_WRITE
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESS_WRITE => 1048576

    /**
     * Native name: D3D12_BARRIER_ACCESS_VIDEO_ENCODE_READ
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODE_READ => 2097152

    /**
     * Native name: D3D12_BARRIER_ACCESS_VIDEO_ENCODE_WRITE
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODE_WRITE => 4194304

    /**
     * Native name: D3D12_BARRIER_ACCESS_NO_ACCESS
     * @type {Integer (Int32)}
     */
    static NO_ACCESS => -2147483648
}
