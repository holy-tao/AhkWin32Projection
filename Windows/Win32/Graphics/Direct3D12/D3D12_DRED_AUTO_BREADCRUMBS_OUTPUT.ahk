#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a pointer to the head of a linked list of D3D12_AUTO_BREADCRUMB_NODE objects.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_dred_auto_breadcrumbs_output
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A pointer to a constant [D3D12_AUTO_BREADCRUMB_NODE](ns-d3d12-d3d12_auto_breadcrumb_node.md) object representing the head of a linked list of auto-breadcrumb nodes, or `nullptr` if the list is empty.
     * @type {Pointer<D3D12_AUTO_BREADCRUMB_NODE>}
     */
    pHeadAutoBreadcrumbNode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
