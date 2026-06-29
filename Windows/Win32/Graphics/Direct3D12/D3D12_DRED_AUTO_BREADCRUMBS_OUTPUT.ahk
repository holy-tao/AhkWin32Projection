#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_AUTO_BREADCRUMB_NODE.ahk" { D3D12_AUTO_BREADCRUMB_NODE }

/**
 * Contains a pointer to the head of a linked list of D3D12_AUTO_BREADCRUMB_NODE objects.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_auto_breadcrumbs_output
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT {
    #StructPack 8

    /**
     * A pointer to a constant [D3D12_AUTO_BREADCRUMB_NODE](ns-d3d12-d3d12_auto_breadcrumb_node.md) object representing the head of a linked list of auto-breadcrumb nodes, or `nullptr` if the list is empty.
     */
    pHeadAutoBreadcrumbNode : D3D12_AUTO_BREADCRUMB_NODE.Ptr

}
