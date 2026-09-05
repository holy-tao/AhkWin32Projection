#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_GRAPHICS_PREEMPTION_GRANULARITY extends Win32Enum {

    /**
     * Native name: D3DKMDT_GRAPHICS_PREEMPTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3DKMDT_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY
     * @type {Integer (Int32)}
     */
    static DMA_BUFFER_BOUNDARY => 100

    /**
     * Native name: D3DKMDT_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY
     * @type {Integer (Int32)}
     */
    static PRIMITIVE_BOUNDARY => 200

    /**
     * Native name: D3DKMDT_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY
     * @type {Integer (Int32)}
     */
    static TRIANGLE_BOUNDARY => 300

    /**
     * Native name: D3DKMDT_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY
     * @type {Integer (Int32)}
     */
    static PIXEL_BOUNDARY => 400

    /**
     * Native name: D3DKMDT_GRAPHICS_PREEMPTION_SHADER_BOUNDARY
     * @type {Integer (Int32)}
     */
    static SHADER_BOUNDARY => 500
}
