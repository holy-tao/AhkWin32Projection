#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A state subobject that identifies the GPU nodes to which the state object applies.
 * @remarks
 * This subobject is optional. In its absence, the state object applies to all available nodes.  If a node mask subobject has been associated with any part of a state object, a node mask association must be made to all exports in a state object (including imported collections) and all node mask subobjects that are referenced must have matching content.
  * 
  * > [!IMPORTANT]
  * > On some versions of the DirectX Runtime, specifying a node via **D3D12_NODE_MASK** in a [**D3D12_STATE_SUBOBJECT**](/windows/win32/api/d3d12/ns-d3d12-d3d12_state_subobject) with type [**D3D12_STATE_SUBOBJECT_TYPE_NODE_MASK**](/windows/win32/api/d3d12/ne-d3d12-d3d12_state_subobject_type), the runtime will incorrectly handle a node mask value of `0`, which should use node #1, which will lead to errors when attempting to use the state object later. Specify an explicit node value of 1, or omit the **D3D12_NODE_MASK** subobject to avoid this issue.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_node_mask
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_NODE_MASK extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The node mask.
     * @type {Integer}
     */
    NodeMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
