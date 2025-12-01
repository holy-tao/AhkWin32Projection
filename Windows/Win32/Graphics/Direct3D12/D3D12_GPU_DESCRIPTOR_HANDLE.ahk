#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a GPU descriptor handle.
 * @remarks
 * This structure is returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12descriptorheap-getgpudescriptorhandleforheapstart">ID3D12DescriptorHeap::GetGPUDescriptorHandleForHeapStart</a>.
 *       
 * 
 * This structure is passed into the following methods:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewfloat">ID3D12GraphicsCommandList::ClearUnorderedAccessViewFloat</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewuint">ID3D12GraphicsCommandList::ClearUnorderedAccessViewUint</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setcomputerootdescriptortable">ID3D12GraphicsCommandList:SetComputeRootDescriptorTable</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setgraphicsrootdescriptortable">ID3D12GraphicsCommandList::SetGraphicsRootDescriptorTable</a>
 * </li>
 * </ul>
 * 
 * To get the handle increment size use <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-getdescriptorhandleincrementsize">ID3D12Device.GetDescriptorHandleIncrementSize</a>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_GPU_DESCRIPTOR_HANDLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The address of the descriptor.
     * @type {Integer}
     */
    ptr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
