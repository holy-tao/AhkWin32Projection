#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes, as a node in a linked list, data about an allocation tracked by Device Removed Extended Data (DRED).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_allocation_node
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DRED_ALLOCATION_NODE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to the ANSI debug name of the allocated runtime object.
     * @type {Pointer<Byte>}
     */
    ObjectNameA {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the wide debug name of the allocated runtime object.
     * @type {Pointer<Ptr>}
     */
    ObjectNameW {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A [D3D12_DRED_ALLOCATION_TYPE](ne-d3d12-d3d12_dred_allocation_type.md) value representing the runtime object's allocation type.
     * @type {Integer}
     */
    AllocationType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A pointer to a constant **D3D12_DRED_ALLOCATION_NODE** representing the next allocation node in the list, or `nullptr` if this is the last node.
     * @type {Pointer<D3D12_DRED_ALLOCATION_NODE>}
     */
    pNext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
