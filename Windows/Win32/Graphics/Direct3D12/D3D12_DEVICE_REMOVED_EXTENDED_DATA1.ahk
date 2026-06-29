#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT.ahk" { D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT }
#Import ".\D3D12_DRED_ALLOCATION_NODE.ahk" { D3D12_DRED_ALLOCATION_NODE }
#Import ".\D3D12_AUTO_BREADCRUMB_NODE.ahk" { D3D12_AUTO_BREADCRUMB_NODE }

/**
 * Represents Device Removed Extended Data (DRED) version 1.1 data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_device_removed_extended_data1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEVICE_REMOVED_EXTENDED_DATA1 {
    #StructPack 8

    /**
     * An [HRESULT](/windows/desktop/com/structure-of-com-error-codes) containing the reason the device was removed (matches the return value of [GetDeviceRemovedReason](/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getdeviceremovedreason)). Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/desktop/com/com-error-codes-10).
     */
    DeviceRemovedReason : HRESULT

    /**
     * A [D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT](ns-d3d12-d3d12_auto_breadcrumb_node.md) value that contains the auto-breadcrumb state prior to device removal.
     */
    AutoBreadcrumbsOutput : D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT

    /**
     * A [D3D12_DRED_PAGE_FAULT_OUTPUT](ns-d3d12-d3d12_auto_breadcrumb_node.md) value that contains page fault data if device removal was the result of a GPU page fault.
     */
    PageFaultOutput : D3D12_DRED_PAGE_FAULT_OUTPUT

}
