#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_GRAPHICS_PREEMPTION_GRANULARITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GRAPHICS_PREEMPTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY => 100

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY => 200

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY => 300

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY => 400

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GRAPHICS_PREEMPTION_SHADER_BOUNDARY => 500
}
