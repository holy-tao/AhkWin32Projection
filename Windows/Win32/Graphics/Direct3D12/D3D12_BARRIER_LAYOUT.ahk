#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BARRIER_LAYOUT{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_UNDEFINED => -1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMMON => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_PRESENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_GENERIC_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_RENDER_TARGET => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_UNORDERED_ACCESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DEPTH_STENCIL_WRITE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DEPTH_STENCIL_READ => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_SHADER_RESOURCE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COPY_SOURCE => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COPY_DEST => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_RESOLVE_SOURCE => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_RESOLVE_DEST => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_SHADING_RATE_SOURCE => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_DECODE_READ => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_DECODE_WRITE => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_PROCESS_READ => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_PROCESS_WRITE => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_ENCODE_READ => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_ENCODE_WRITE => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_COMMON => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_GENERIC_READ => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_UNORDERED_ACCESS => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_SHADER_RESOURCE => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_COPY_SOURCE => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_COPY_DEST => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_COMMON => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_GENERIC_READ => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_UNORDERED_ACCESS => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_SHADER_RESOURCE => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_COPY_SOURCE => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_COPY_DEST => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_BARRIER_LAYOUT_VIDEO_QUEUE_COMMON => 30
}
