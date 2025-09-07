#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the transition of subresources between different usages.
 * @remarks
 * This struct is used by the <b>Transition</b> member of the
  *         <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a> struct.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_transition_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_TRANSITION_BARRIER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the resource used in the transition.
     * @type {Pointer<ID3D12Resource>}
     */
    pResource {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The index of the subresource for the transition.
     *             Use the <b>D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES</b> flag ( 0xffffffff ) to transition all subresources in a resource at the same time.
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The "before" usages of the subresources, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     * @type {Integer}
     */
    StateBefore {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The "after" usages of the subresources, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     * @type {Integer}
     */
    StateAfter {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
