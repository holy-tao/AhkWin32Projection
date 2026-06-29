#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DRED_FLAGS.ahk" { D3D12_DRED_FLAGS }
#Import ".\D3D12_AUTO_BREADCRUMB_NODE.ahk" { D3D12_AUTO_BREADCRUMB_NODE }

/**
 * Represents Device Removed Extended Data (DRED) version 1.0 data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_device_removed_extended_data
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEVICE_REMOVED_EXTENDED_DATA {
    #StructPack 8

    /**
     * An input parameter of type [D3D12_DRED_FLAGS](ne-d3d12-d3d12_dred_flags.md), specifying control flags for the Direct3D runtime.
     */
    Flags : D3D12_DRED_FLAGS

    /**
     * An output parameter of type pointer to [D3D12_AUTO_BREADCRUMB_NODE](ns-d3d12-d3d12_auto_breadcrumb_node.md) representing the returned auto-breadcrumb object(s). This is a pointer to the head of a linked list of auto-breadcrumb objects. All of the nodes in the linked list represent potentially incomplete command list execution on the GPU at the time of the device-removal event.
     */
    pHeadAutoBreadcrumbNode : D3D12_AUTO_BREADCRUMB_NODE.Ptr

}
