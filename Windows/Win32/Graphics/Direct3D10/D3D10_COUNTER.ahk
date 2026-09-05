#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Performance counter types.
 * @remarks
 * In addition to these performance counters, independent hardware vendors may define their own set of performance counters for their devices. The enum values for these counters would start after D3D10_COUNTER_DEVICE_DEPENDENT_0 and would be defined by those hardware vendors.
 * 
 * A device can support one or more of these performance counters, but it is not required to support any of them.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_counter
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_COUNTER extends Win32Enum {

    /**
     * Percentage of the time that the GPU is idle.
     * Native name: D3D10_COUNTER_GPU_IDLE
     * @type {Integer (Int32)}
     */
    static GPU_IDLE => 0

    /**
     * Percentage of the time that the GPU does vertex processing.
     * Native name: D3D10_COUNTER_VERTEX_PROCESSING
     * @type {Integer (Int32)}
     */
    static VERTEX_PROCESSING => 1

    /**
     * Percentage of the time that the GPU does geometry processing.
     * Native name: D3D10_COUNTER_GEOMETRY_PROCESSING
     * @type {Integer (Int32)}
     */
    static GEOMETRY_PROCESSING => 2

    /**
     * Percentage of the time that the GPU does pixel processing.
     * Native name: D3D10_COUNTER_PIXEL_PROCESSING
     * @type {Integer (Int32)}
     */
    static PIXEL_PROCESSING => 3

    /**
     * Percentage of the time that the GPU does other processing (not vertex, geometry, or pixel processing).
     * Native name: D3D10_COUNTER_OTHER_GPU_PROCESSING
     * @type {Integer (Int32)}
     */
    static OTHER_GPU_PROCESSING => 4

    /**
     * Percentage of bandwidth used on a host adapter. Value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> between 0.0 and 1.0 when using this counter.
     * Native name: D3D10_COUNTER_HOST_ADAPTER_BANDWIDTH_UTILIZATION
     * @type {Integer (Int32)}
     */
    static HOST_ADAPTER_BANDWIDTH_UTILIZATION => 5

    /**
     * Percentage of bandwidth used by the local video memory. Value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> between 0.0 and 1.0 when using this counter
     * Native name: D3D10_COUNTER_LOCAL_VIDMEM_BANDWIDTH_UTILIZATION
     * @type {Integer (Int32)}
     */
    static LOCAL_VIDMEM_BANDWIDTH_UTILIZATION => 6

    /**
     * Percentage of throughput used for vertices. Value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> between 0.0 and 1.0 when using this counter
     * Native name: D3D10_COUNTER_VERTEX_THROUGHPUT_UTILIZATION
     * @type {Integer (Int32)}
     */
    static VERTEX_THROUGHPUT_UTILIZATION => 7

    /**
     * Percentage of throughput used for triangle setup. Value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> between 0.0 and 1.0 when using this counter
     * Native name: D3D10_COUNTER_TRIANGLE_SETUP_THROUGHPUT_UTILIZATION
     * @type {Integer (Int32)}
     */
    static TRIANGLE_SETUP_THROUGHPUT_UTILIZATION => 8

    /**
     * Percentage of throughput used for the fillrate. Value returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">ID3D10Asynchronous::GetData</a> between 0.0 and 1.0 when using this counter.
     * Native name: D3D10_COUNTER_FILLRATE_THROUGHPUT_UTILIZATION
     * @type {Integer (Int32)}
     */
    static FILLRATE_THROUGHPUT_UTILIZATION => 9

    /**
     * Percentage of time that a vertex shader spends sampling resources.
     * Native name: D3D10_COUNTER_VS_MEMORY_LIMITED
     * @type {Integer (Int32)}
     */
    static VS_MEMORY_LIMITED => 10

    /**
     * Percentage of time that a vertex shader spends doing computations.
     * Native name: D3D10_COUNTER_VS_COMPUTATION_LIMITED
     * @type {Integer (Int32)}
     */
    static VS_COMPUTATION_LIMITED => 11

    /**
     * Percentage of time that a geometry shader spends sampling resources.
     * Native name: D3D10_COUNTER_GS_MEMORY_LIMITED
     * @type {Integer (Int32)}
     */
    static GS_MEMORY_LIMITED => 12

    /**
     * Percentage of time that a geometry shader spends doing computations.
     * Native name: D3D10_COUNTER_GS_COMPUTATION_LIMITED
     * @type {Integer (Int32)}
     */
    static GS_COMPUTATION_LIMITED => 13

    /**
     * Percentage of time that a pixel shader spends sampling resources.
     * Native name: D3D10_COUNTER_PS_MEMORY_LIMITED
     * @type {Integer (Int32)}
     */
    static PS_MEMORY_LIMITED => 14

    /**
     * Percentage of time that a pixel shader spends doing computations.
     * Native name: D3D10_COUNTER_PS_COMPUTATION_LIMITED
     * @type {Integer (Int32)}
     */
    static PS_COMPUTATION_LIMITED => 15

    /**
     * Percentage of vertex data that was read from the vertex cache. For example, if 6 vertices were added to the cache and 3 of them were read from the cache, then the hit rate would be 0.5.
     * Native name: D3D10_COUNTER_POST_TRANSFORM_CACHE_HIT_RATE
     * @type {Integer (Int32)}
     */
    static POST_TRANSFORM_CACHE_HIT_RATE => 16

    /**
     * Percentage of texel data that was read from the vertex cache. For example, if 6 texels were added to the cache and 3 of them were read from the cache, then the hit rate would be 0.5.
     * Native name: D3D10_COUNTER_TEXTURE_CACHE_HIT_RATE
     * @type {Integer (Int32)}
     */
    static TEXTURE_CACHE_HIT_RATE => 17

    /**
     * Start of the device-dependent counters. See remarks.
     * Native name: D3D10_COUNTER_DEVICE_DEPENDENT_0
     * @type {Integer (Int32)}
     */
    static DEVICE_DEPENDENT_0 => 1073741824
}
