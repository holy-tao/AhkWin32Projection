#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the viewport/stencil and render target associated with a view instance.
 * @remarks
 * The values specified in a view instance location structure can be added to ViewportArrayIndex and RenderTargetArrayIndex values output by the shader prior to rasterization to compute the final effective index of the viewport and render target to send primitives to. If a computed index is out of range (that is, when the index is larger than the number of viewport or render target elements in their respective arrays) then the effective index becomes 0.
 * 
 * For shaders that dynamically select the viewport or render target indices, an application can set all the view instance locations declared in a PSO to the same value to act as a uniform base value for all views.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_view_instance_location
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VIEW_INSTANCE_LOCATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The index of the viewport in the viewports array to be used by the view instance associated with this location.
     * @type {Integer}
     */
    ViewportArrayIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the render target in the render targets array to be used by the view instance associated with this location.
     * @type {Integer}
     */
    RenderTargetArrayIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
