#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the granularity at which the graphics processing unit (GPU) can be preempted from performing its current graphics rendering task.
 * @remarks
 * 
 * You call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiadapter2-getdesc2">IDXGIAdapter2::GetDesc2</a> method to retrieve the granularity level at which the GPU can be preempted from performing its current graphics rendering task. The operating system specifies the graphics granularity level in the  <b>GraphicsPreemptionGranularity</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_adapter_desc2">DXGI_ADAPTER_DESC2</a> structure.
 * 
 * The following figure shows granularity of graphics rendering tasks.
 * 
 * <img alt="Graphics Rendering Granularity" src="./images/Graphics_Preempt.png"/>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ne-dxgi1_2-dxgi_graphics_preemption_granularity
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_GRAPHICS_PREEMPTION_GRANULARITY extends Win32Enum{

    /**
     * Indicates the preemption granularity as a DMA buffer.
     * @type {Integer (Int32)}
     */
    static DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY => 0

    /**
     * Indicates the preemption granularity as a graphics primitive. A primitive is a section in a DMA buffer and can be a group of triangles.
     * @type {Integer (Int32)}
     */
    static DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY => 1

    /**
     * Indicates the preemption granularity as a triangle. A triangle is a part of a primitive.
     * @type {Integer (Int32)}
     */
    static DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY => 2

    /**
     * Indicates the preemption granularity as a pixel. A pixel is a part of a triangle.
     * @type {Integer (Int32)}
     */
    static DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY => 3

    /**
     * Indicates the preemption granularity as a graphics instruction. A graphics instruction operates on a pixel.
     * @type {Integer (Int32)}
     */
    static DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY => 4
}
