#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of geometry shader input primitive.
 * @remarks
 * <b>D3D11_TRACE_GS_INPUT_PRIMITIVE</b> identifies the type of geometry shader input primitive in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats">D3D11_TRACE_STATS</a> structure.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_gs_input_primitive
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_TRACE_GS_INPUT_PRIMITIVE extends Win32Enum {

    /**
     * Identifies the geometry shader input primitive as undefined.
     * Native name: D3D11_TRACE_GS_INPUT_PRIMITIVE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Identifies the geometry shader input primitive as a point.
     * Native name: D3D11_TRACE_GS_INPUT_PRIMITIVE_POINT
     * @type {Integer (Int32)}
     */
    static POINT => 1

    /**
     * Identifies the geometry shader input primitive as a line.
     * Native name: D3D11_TRACE_GS_INPUT_PRIMITIVE_LINE
     * @type {Integer (Int32)}
     */
    static LINE => 2

    /**
     * Identifies the geometry shader input primitive as a triangle.
     * Native name: D3D11_TRACE_GS_INPUT_PRIMITIVE_TRIANGLE
     * @type {Integer (Int32)}
     */
    static TRIANGLE => 3

    /**
     * Identifies the geometry shader input primitive as an adjacent line.
     * Native name: D3D11_TRACE_GS_INPUT_PRIMITIVE_LINE_ADJ
     * @type {Integer (Int32)}
     */
    static LINE_ADJ => 6

    /**
     * Identifies the geometry shader input primitive as an adjacent triangle.
     * Native name: D3D11_TRACE_GS_INPUT_PRIMITIVE_TRIANGLE_ADJ
     * @type {Integer (Int32)}
     */
    static TRIANGLE_ADJ => 7
}
