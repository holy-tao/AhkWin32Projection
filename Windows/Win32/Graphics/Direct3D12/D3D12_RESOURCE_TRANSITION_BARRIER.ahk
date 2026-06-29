#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RESOURCE_STATES.ahk" { D3D12_RESOURCE_STATES }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Describes the transition of subresources between different usages.
 * @remarks
 * This struct is used by the <b>Transition</b> member of the
 *         <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a> struct.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_transition_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOURCE_TRANSITION_BARRIER {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the resource used in the transition.
     */
    pResource : ID3D12Resource

    /**
     * The index of the subresource for the transition.
     *             Use the <b>D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES</b> flag ( 0xffffffff ) to transition all subresources in a resource at the same time.
     */
    Subresource : UInt32

    /**
     * The "before" usages of the subresources, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     */
    StateBefore : D3D12_RESOURCE_STATES

    /**
     * The "after" usages of the subresources, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_resource_states">D3D12_RESOURCE_STATES</a> enumeration constants.
     */
    StateAfter : D3D12_RESOURCE_STATES

}
