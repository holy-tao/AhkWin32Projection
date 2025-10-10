#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents Device Removed Extended Data (DRED) auto-breadcrumb data as a node in a linked list.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_auto_breadcrumb_node
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_AUTO_BREADCRUMB_NODE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A pointer to the ANSI debug name of the outstanding command list (if any).
     * @type {Pointer<Byte>}
     */
    pCommandListDebugNameA {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the wide debug name of the outstanding command list (if any).
     * @type {Pointer<Char>}
     */
    pCommandListDebugNameW {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the ANSI debug name of the outstanding command queue (if any).
     * @type {Pointer<Byte>}
     */
    pCommandQueueDebugNameA {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the wide debug name of the outstanding command queue (if any).
     * @type {Pointer<Char>}
     */
    pCommandQueueDebugNameW {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the [ID3D12GraphicsCommandList interface](nn-d3d12-id3d12graphicscommandlist.md) representing the outstanding command list at the time of execution.
     * @type {Pointer<ID3D12GraphicsCommandList>}
     */
    pCommandList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the [ID3D12CommandQueue interface](nn-d3d12-id3d12commandqueue.md) representing the outstanding command queue.
     * @type {Pointer<ID3D12CommandQueue>}
     */
    pCommandQueue {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A **UINT32** containing the count of [D3D12_AUTO_BREADCRUMB_OP](ne-d3d12-d3d12_auto_breadcrumb_op.md) values in the array pointed to by `pCommandHistory`.
     * @type {Integer}
     */
    BreadcrumbCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to a constant **UINT32** containing the index (within the array pointed to by `pCommandHistory`) of the last render/compute operation that was completed by the GPU while executing the associated command list.
     * @type {Pointer<UInt32>}
     */
    pLastBreadcrumbValue {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a constant array of [D3D12_AUTO_BREADCRUMB_OP](ne-d3d12-d3d12_auto_breadcrumb_op.md) values representing all of the render/compute operations recorded into the associated command list.
     * @type {Pointer<Int32>}
     */
    pCommandHistory {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to a constant **D3D12_AUTO_BREADCRUMB_NODE** representing the next auto-breadcrumb node in the list, or `nullptr` if this is the last node.
     * @type {Pointer<D3D12_AUTO_BREADCRUMB_NODE>}
     */
    pNext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
