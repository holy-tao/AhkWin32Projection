#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1.ahk" { D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1 }
#Import ".\D3D12_DRED_ALLOCATION_NODE1.ahk" { D3D12_DRED_ALLOCATION_NODE1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT1.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT1 }
#Import ".\D3D12_AUTO_BREADCRUMB_NODE1.ahk" { D3D12_AUTO_BREADCRUMB_NODE1 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEVICE_REMOVED_EXTENDED_DATA2 {
    #StructPack 8

    DeviceRemovedReason : HRESULT

    AutoBreadcrumbsOutput : D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1

    PageFaultOutput : D3D12_DRED_PAGE_FAULT_OUTPUT1

}
