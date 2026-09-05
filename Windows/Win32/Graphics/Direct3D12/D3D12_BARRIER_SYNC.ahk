#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_BARRIER_SYNC extends Win32BitflagEnum {

    /**
     * Native name: D3D12_BARRIER_SYNC_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3D12_BARRIER_SYNC_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 1

    /**
     * Native name: D3D12_BARRIER_SYNC_DRAW
     * @type {Integer (Int32)}
     */
    static DRAW => 2

    /**
     * Native name: D3D12_BARRIER_SYNC_INDEX_INPUT
     * @type {Integer (Int32)}
     */
    static INDEX_INPUT => 4

    /**
     * Native name: D3D12_BARRIER_SYNC_VERTEX_SHADING
     * @type {Integer (Int32)}
     */
    static VERTEX_SHADING => 8

    /**
     * Native name: D3D12_BARRIER_SYNC_PIXEL_SHADING
     * @type {Integer (Int32)}
     */
    static PIXEL_SHADING => 16

    /**
     * Native name: D3D12_BARRIER_SYNC_DEPTH_STENCIL
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL => 32

    /**
     * Native name: D3D12_BARRIER_SYNC_RENDER_TARGET
     * @type {Integer (Int32)}
     */
    static RENDER_TARGET => 64

    /**
     * Native name: D3D12_BARRIER_SYNC_COMPUTE_SHADING
     * @type {Integer (Int32)}
     */
    static COMPUTE_SHADING => 128

    /**
     * Native name: D3D12_BARRIER_SYNC_RAYTRACING
     * @type {Integer (Int32)}
     */
    static RAYTRACING => 256

    /**
     * Native name: D3D12_BARRIER_SYNC_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 512

    /**
     * Native name: D3D12_BARRIER_SYNC_RESOLVE
     * @type {Integer (Int32)}
     */
    static RESOLVE => 1024

    /**
     * Native name: D3D12_BARRIER_SYNC_EXECUTE_INDIRECT
     * @type {Integer (Int32)}
     */
    static EXECUTE_INDIRECT => 2048

    /**
     * Native name: D3D12_BARRIER_SYNC_PREDICATION
     * @type {Integer (Int32)}
     */
    static PREDICATION => 2048

    /**
     * Native name: D3D12_BARRIER_SYNC_ALL_SHADING
     * @type {Integer (Int32)}
     */
    static ALL_SHADING => 4096

    /**
     * Native name: D3D12_BARRIER_SYNC_NON_PIXEL_SHADING
     * @type {Integer (Int32)}
     */
    static NON_PIXEL_SHADING => 8192

    /**
     * Native name: D3D12_BARRIER_SYNC_EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO
     * @type {Integer (Int32)}
     */
    static EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO => 16384

    /**
     * Native name: D3D12_BARRIER_SYNC_CLEAR_UNORDERED_ACCESS_VIEW
     * @type {Integer (Int32)}
     */
    static CLEAR_UNORDERED_ACCESS_VIEW => 32768

    /**
     * Native name: D3D12_BARRIER_SYNC_VIDEO_DECODE
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODE => 1048576

    /**
     * Native name: D3D12_BARRIER_SYNC_VIDEO_PROCESS
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESS => 2097152

    /**
     * Native name: D3D12_BARRIER_SYNC_VIDEO_ENCODE
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODE => 4194304

    /**
     * Native name: D3D12_BARRIER_SYNC_BUILD_RAYTRACING_ACCELERATION_STRUCTURE
     * @type {Integer (Int32)}
     */
    static BUILD_RAYTRACING_ACCELERATION_STRUCTURE => 8388608

    /**
     * Native name: D3D12_BARRIER_SYNC_COPY_RAYTRACING_ACCELERATION_STRUCTURE
     * @type {Integer (Int32)}
     */
    static COPY_RAYTRACING_ACCELERATION_STRUCTURE => 16777216

    /**
     * Native name: D3D12_BARRIER_SYNC_SPLIT
     * @type {Integer (Int32)}
     */
    static SPLIT => -2147483648
}
