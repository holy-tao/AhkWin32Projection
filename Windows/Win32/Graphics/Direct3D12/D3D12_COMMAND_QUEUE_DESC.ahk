#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a command queue.
 * @remarks
 * This structure is passed into <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandqueue">CreateCommandQueue</a>.
 *         
 * 
 * This structure is returned by <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandqueue-getdesc">ID3D12CommandQueue::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_command_queue_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_QUEUE_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies one member of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_type">D3D12_COMMAND_LIST_TYPE</a>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The priority for the command queue, as a 
     *             <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_queue_priority">D3D12_COMMAND_QUEUE_PRIORITY</a> enumeration constant to select normal or high priority.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies any flags from the <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_queue_flags">D3D12_COMMAND_QUEUE_FLAGS</a> enumeration.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the  device's physical adapter) to which the command queue applies.
     *             Each bit in the mask corresponds to a single node.
     *             Only 1 bit must be set.
     *           Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
