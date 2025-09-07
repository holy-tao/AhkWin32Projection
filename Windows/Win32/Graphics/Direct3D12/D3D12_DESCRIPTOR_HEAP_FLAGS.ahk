#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options for a heap.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc">D3D12_DESCRIPTOR_HEAP_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DESCRIPTOR_HEAP_FLAGS{

    /**
     * Indicates default usage of a heap.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_FLAG_NONE => 0

    /**
     * The flag [D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE](/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_flags) can optionally be set on a descriptor heap to indicate it is be bound on a command list for reference by shaders. Descriptor heaps created <i>without</i> this flag allow applications the option to stage descriptors in CPU memory before copying them to a shader visible descriptor heap, as a convenience. But it is also fine for applications to directly create descriptors into shader visible descriptor heaps with no requirement to stage anything on the CPU.
 * 
 * Descriptor heaps bound via [ID3D12GraphicsCommandList::SetDescriptorHeaps](/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setdescriptorheaps) must have the **D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE** flag set, else the debug layer will produce an error.
 * 
 * Descriptor heaps with the **D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE** flag can't be used as the source heaps in calls to [ID3D12Device::CopyDescriptors](/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptors) or [ID3D12Device::CopyDescriptorsSimple](/windows/win32/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple), because they could be resident in **WRITE_COMBINE** memory or GPU-local memory, which is very inefficient to read from.
 * 
 * This flag only applies to CBV/SRV/UAV descriptor heaps, and sampler descriptor heaps. It does not apply to other descriptor heap types since shaders do not directly reference the other types. Attempting to create an RTV/DSV heap with **D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE** results in a debug layer error.
     * @type {Integer (Int32)}
     */
    static D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE => 1
}
