#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12GraphicsCommandList.ahk" { ID3D12GraphicsCommandList }
#Import ".\ID3D12CommandQueue.ahk" { ID3D12CommandQueue }
#Import ".\D3D12_AUTO_BREADCRUMB_OP.ahk" { D3D12_AUTO_BREADCRUMB_OP }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents Device Removed Extended Data (DRED) auto-breadcrumb data as a node in a linked list.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_auto_breadcrumb_node
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_AUTO_BREADCRUMB_NODE {
    #StructPack 8

    /**
     * A pointer to the ANSI debug name of the outstanding command list (if any).
     */
    pCommandListDebugNameA : IntPtr

    /**
     * A pointer to the wide debug name of the outstanding command list (if any).
     */
    pCommandListDebugNameW : PWSTR

    /**
     * A pointer to the ANSI debug name of the outstanding command queue (if any).
     */
    pCommandQueueDebugNameA : IntPtr

    /**
     * A pointer to the wide debug name of the outstanding command queue (if any).
     */
    pCommandQueueDebugNameW : PWSTR

    /**
     * A pointer to the [ID3D12GraphicsCommandList interface](nn-d3d12-id3d12graphicscommandlist.md) representing the outstanding command list at the time of execution.
     */
    pCommandList : ID3D12GraphicsCommandList

    /**
     * A pointer to the [ID3D12CommandQueue interface](nn-d3d12-id3d12commandqueue.md) representing the outstanding command queue.
     */
    pCommandQueue : ID3D12CommandQueue

    /**
     * A **UINT32** containing the count of [D3D12_AUTO_BREADCRUMB_OP](ne-d3d12-d3d12_auto_breadcrumb_op.md) values in the array pointed to by `pCommandHistory`.
     */
    BreadcrumbCount : UInt32

    /**
     * A pointer to a constant **UINT32** containing the index (within the array pointed to by `pCommandHistory`) of the last render/compute operation that was completed by the GPU while executing the associated command list.
     */
    pLastBreadcrumbValue : IntPtr

    /**
     * A pointer to a constant array of [D3D12_AUTO_BREADCRUMB_OP](ne-d3d12-d3d12_auto_breadcrumb_op.md) values representing all of the render/compute operations recorded into the associated command list.
     */
    pCommandHistory : D3D12_AUTO_BREADCRUMB_OP.Ptr

    /**
     * A pointer to a constant **D3D12_AUTO_BREADCRUMB_NODE** representing the next auto-breadcrumb node in the list, or `nullptr` if this is the last node.
     */
    pNext : D3D12_AUTO_BREADCRUMB_NODE.Ptr

}
