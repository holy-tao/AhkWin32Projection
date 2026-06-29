#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1.ahk" { D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1 }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DEVICE_REMOVED_EXTENDED_DATA.ahk" { D3D12_DEVICE_REMOVED_EXTENDED_DATA }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT2.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT2 }
#Import ".\D3D12_DEVICE_REMOVED_EXTENDED_DATA1.ahk" { D3D12_DEVICE_REMOVED_EXTENDED_DATA1 }
#Import ".\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT.ahk" { D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT }
#Import ".\D3D12_DRED_PAGE_FAULT_FLAGS.ahk" { D3D12_DRED_PAGE_FAULT_FLAGS }
#Import ".\D3D12_AUTO_BREADCRUMB_NODE1.ahk" { D3D12_AUTO_BREADCRUMB_NODE1 }
#Import ".\D3D12_DEVICE_REMOVED_EXTENDED_DATA3.ahk" { D3D12_DEVICE_REMOVED_EXTENDED_DATA3 }
#Import ".\D3D12_DRED_DEVICE_STATE.ahk" { D3D12_DRED_DEVICE_STATE }
#Import ".\D3D12_DRED_ALLOCATION_NODE.ahk" { D3D12_DRED_ALLOCATION_NODE }
#Import ".\D3D12_AUTO_BREADCRUMB_NODE.ahk" { D3D12_AUTO_BREADCRUMB_NODE }
#Import ".\D3D12_DRED_ALLOCATION_NODE1.ahk" { D3D12_DRED_ALLOCATION_NODE1 }
#Import ".\D3D12_DRED_PAGE_FAULT_OUTPUT1.ahk" { D3D12_DRED_PAGE_FAULT_OUTPUT1 }
#Import ".\D3D12_DRED_FLAGS.ahk" { D3D12_DRED_FLAGS }
#Import ".\D3D12_DEVICE_REMOVED_EXTENDED_DATA2.ahk" { D3D12_DEVICE_REMOVED_EXTENDED_DATA2 }
#Import ".\D3D12_DRED_VERSION.ahk" { D3D12_DRED_VERSION }

/**
 * Represents versioned Device Removed Extended Data (DRED) data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_versioned_device_removed_extended_data
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_VERSIONED_DEVICE_REMOVED_EXTENDED_DATA {
    #StructPack 8

    /**
     * A [D3D12_DRED_VERSION](ne-d3d12-d3d12_dred_version.md) value, specifying a DRED version. This value determines which inner data member (of the union) is active.
     */
    Version : D3D12_DRED_VERSION

    Dred_1_0 : D3D12_DEVICE_REMOVED_EXTENDED_DATA

    static __New() {
        DefineProp(this.Prototype, 'Dred_1_1', { type: D3D12_DEVICE_REMOVED_EXTENDED_DATA1, offset: 8 })
        DefineProp(this.Prototype, 'Dred_1_2', { type: D3D12_DEVICE_REMOVED_EXTENDED_DATA2, offset: 8 })
        DefineProp(this.Prototype, 'Dred_1_3', { type: D3D12_DEVICE_REMOVED_EXTENDED_DATA3, offset: 8 })
        this.DeleteProp("__New")
    }
}
