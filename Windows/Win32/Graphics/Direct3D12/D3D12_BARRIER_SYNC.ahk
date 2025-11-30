#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BARRIER_SYNC extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_ALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_DRAW => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_INDEX_INPUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_VERTEX_SHADING => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_PIXEL_SHADING => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_DEPTH_STENCIL => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_RENDER_TARGET => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_COMPUTE_SHADING => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_RAYTRACING => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_COPY => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_RESOLVE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_EXECUTE_INDIRECT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_PREDICATION => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_ALL_SHADING => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_NON_PIXEL_SHADING => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_CLEAR_UNORDERED_ACCESS_VIEW => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_VIDEO_DECODE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_VIDEO_PROCESS => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_VIDEO_ENCODE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_BUILD_RAYTRACING_ACCELERATION_STRUCTURE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_COPY_RAYTRACING_ACCELERATION_STRUCTURE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_SYNC_SPLIT => -2147483648
}
