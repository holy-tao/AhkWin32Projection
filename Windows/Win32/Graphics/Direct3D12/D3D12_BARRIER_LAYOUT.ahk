#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_BARRIER_LAYOUT extends Win32Enum {

    /**
     * Native name: D3D12_BARRIER_LAYOUT_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => -1

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMMON
     * @type {Integer (Int32)}
     */
    static COMMON => 0

    /**
     * Native name: D3D12_BARRIER_LAYOUT_PRESENT
     * @type {Integer (Int32)}
     */
    static PRESENT => 0

    /**
     * Native name: D3D12_BARRIER_LAYOUT_GENERIC_READ
     * @type {Integer (Int32)}
     */
    static GENERIC_READ => 1

    /**
     * Native name: D3D12_BARRIER_LAYOUT_RENDER_TARGET
     * @type {Integer (Int32)}
     */
    static RENDER_TARGET => 2

    /**
     * Native name: D3D12_BARRIER_LAYOUT_UNORDERED_ACCESS
     * @type {Integer (Int32)}
     */
    static UNORDERED_ACCESS => 3

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DEPTH_STENCIL_WRITE
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL_WRITE => 4

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DEPTH_STENCIL_READ
     * @type {Integer (Int32)}
     */
    static DEPTH_STENCIL_READ => 5

    /**
     * Native name: D3D12_BARRIER_LAYOUT_SHADER_RESOURCE
     * @type {Integer (Int32)}
     */
    static SHADER_RESOURCE => 6

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COPY_SOURCE
     * @type {Integer (Int32)}
     */
    static COPY_SOURCE => 7

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COPY_DEST
     * @type {Integer (Int32)}
     */
    static COPY_DEST => 8

    /**
     * Native name: D3D12_BARRIER_LAYOUT_RESOLVE_SOURCE
     * @type {Integer (Int32)}
     */
    static RESOLVE_SOURCE => 9

    /**
     * Native name: D3D12_BARRIER_LAYOUT_RESOLVE_DEST
     * @type {Integer (Int32)}
     */
    static RESOLVE_DEST => 10

    /**
     * Native name: D3D12_BARRIER_LAYOUT_SHADING_RATE_SOURCE
     * @type {Integer (Int32)}
     */
    static SHADING_RATE_SOURCE => 11

    /**
     * Native name: D3D12_BARRIER_LAYOUT_VIDEO_DECODE_READ
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODE_READ => 12

    /**
     * Native name: D3D12_BARRIER_LAYOUT_VIDEO_DECODE_WRITE
     * @type {Integer (Int32)}
     */
    static VIDEO_DECODE_WRITE => 13

    /**
     * Native name: D3D12_BARRIER_LAYOUT_VIDEO_PROCESS_READ
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESS_READ => 14

    /**
     * Native name: D3D12_BARRIER_LAYOUT_VIDEO_PROCESS_WRITE
     * @type {Integer (Int32)}
     */
    static VIDEO_PROCESS_WRITE => 15

    /**
     * Native name: D3D12_BARRIER_LAYOUT_VIDEO_ENCODE_READ
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODE_READ => 16

    /**
     * Native name: D3D12_BARRIER_LAYOUT_VIDEO_ENCODE_WRITE
     * @type {Integer (Int32)}
     */
    static VIDEO_ENCODE_WRITE => 17

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_COMMON
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_COMMON => 18

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_GENERIC_READ
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_GENERIC_READ => 19

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_UNORDERED_ACCESS
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_UNORDERED_ACCESS => 20

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_SHADER_RESOURCE
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_SHADER_RESOURCE => 21

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_COPY_SOURCE
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_COPY_SOURCE => 22

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_COPY_DEST
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_COPY_DEST => 23

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_COMMON
     * @type {Integer (Int32)}
     */
    static COMPUTE_QUEUE_COMMON => 24

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_GENERIC_READ
     * @type {Integer (Int32)}
     */
    static COMPUTE_QUEUE_GENERIC_READ => 25

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_UNORDERED_ACCESS
     * @type {Integer (Int32)}
     */
    static COMPUTE_QUEUE_UNORDERED_ACCESS => 26

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_SHADER_RESOURCE
     * @type {Integer (Int32)}
     */
    static COMPUTE_QUEUE_SHADER_RESOURCE => 27

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_COPY_SOURCE
     * @type {Integer (Int32)}
     */
    static COMPUTE_QUEUE_COPY_SOURCE => 28

    /**
     * Native name: D3D12_BARRIER_LAYOUT_COMPUTE_QUEUE_COPY_DEST
     * @type {Integer (Int32)}
     */
    static COMPUTE_QUEUE_COPY_DEST => 29

    /**
     * Native name: D3D12_BARRIER_LAYOUT_DIRECT_QUEUE_GENERIC_READ_COMPUTE_QUEUE_ACCESSIBLE
     * @type {Integer (Int32)}
     */
    static DIRECT_QUEUE_GENERIC_READ_COMPUTE_QUEUE_ACCESSIBLE => 31
}
