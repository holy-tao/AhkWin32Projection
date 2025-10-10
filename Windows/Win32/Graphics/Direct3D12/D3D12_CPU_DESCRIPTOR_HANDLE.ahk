#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a CPU descriptor handle.
 * @remarks
 * 
  * This structure is returned by the following methods:
  *         
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12descriptorheap-getcpudescriptorhandleforheapstart">ID3D12DescriptorHeap::GetCPUDescriptorHandleForHeapStart</a>
  * </li>
  * </ul>
  * This structure is passed into the following methods:
  *         
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-copydescriptors">ID3D12Device::CopyDescriptors</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-copydescriptorssimple">ID3D12Device::CopyDescriptorsSimple</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createconstantbufferview">ID3D12Device::CreateConstantBufferView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createunorderedaccessview">ID3D12Device::CreateUnorderedAccessView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrendertargetview">ID3D12Device::CreateRenderTargetView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createdepthstencilview">ID3D12Device::CreateDepthStencilView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createsampler">ID3D12Device::CreateSampler</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-cleardepthstencilview">ID3D12GraphicsCommandList::ClearDepthStencilView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearrendertargetview">ID3D12GraphicsCommandList::ClearRenderTargetView</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewuint">ID3D12GraphicsCommandList::ClearUnorderedAccessViewUint</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearunorderedaccessviewfloat">ID3D12GraphicsCommandList::ClearUnorderedAccessViewFloat</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-omsetrendertargets">ID3D12GraphicsCommandList::OMSetRenderTargets</a>
  * </li>
  * </ul>
  * 
  * To get the handle increment size use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/getdescriptorhandleincrementsize">ID3D12Device.GetDescriptorHandleIncrementSize</a>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_cpu_descriptor_handle
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CPU_DESCRIPTOR_HANDLE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The address of  the descriptor.
     * @type {Pointer}
     */
    ptr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
