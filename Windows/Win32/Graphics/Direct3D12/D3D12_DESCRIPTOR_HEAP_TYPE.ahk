#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a type of descriptor heap.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a> structure, and the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-copydescriptors">CopyDescriptors</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple">CopyDescriptorsSimple</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getdescriptorhandleincrementsize">GetDescriptorHandleIncrementSize</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_descriptor_heap_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DESCRIPTOR_HEAP_TYPE extends Win32Enum{

    /**
     * The descriptor heap for the combination of constant-buffer, shader-resource, and unordered-access views.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV => 0

    /**
     * The descriptor heap for the sampler.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_TYPE_SAMPLER => 1

    /**
     * The descriptor heap for the render-target view.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_TYPE_RTV => 2

    /**
     * The descriptor heap for the depth-stencil view.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_TYPE_DSV => 3

    /**
     * The number of types of descriptor heaps.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_TYPE_NUM_TYPES => 4
}
