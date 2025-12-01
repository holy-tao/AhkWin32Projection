#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents Device Removed Extended Data (DRED) version 1.0 data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_device_removed_extended_data
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEVICE_REMOVED_EXTENDED_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An input parameter of type [D3D12_DRED_FLAGS](ne-d3d12-d3d12_dred_flags.md), specifying control flags for the Direct3D runtime.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An output parameter of type pointer to [D3D12_AUTO_BREADCRUMB_NODE](ns-d3d12-d3d12_auto_breadcrumb_node.md) representing the returned auto-breadcrumb object(s). This is a pointer to the head of a linked list of auto-breadcrumb objects. All of the nodes in the linked list represent potentially incomplete command list execution on the GPU at the time of the device-removal event.
     * @type {Pointer<D3D12_AUTO_BREADCRUMB_NODE>}
     */
    pHeadAutoBreadcrumbNode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
