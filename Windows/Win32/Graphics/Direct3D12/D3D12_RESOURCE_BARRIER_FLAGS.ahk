#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags for setting split resource barriers.
 * @remarks
 * 
  * Split barriers allow a single transition to be split into begin and end halves (refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/user-mode-heap-synchronization">Multi-engine synchronization</a>).
  * 
  * This enum is used by the <i>Flags</i> member of the
  *           <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a>structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_resource_barrier_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RESOURCE_BARRIER_FLAGS{

    /**
     * No flags.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BARRIER_FLAG_NONE => 0

    /**
     * This starts a barrier transition in a new state, putting a resource in a temporary no-access condition.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BARRIER_FLAG_BEGIN_ONLY => 1

    /**
     * This barrier completes a transition, setting a new state and restoring active access to a resource.
     * @type {Integer (Int32)}
     */
    static D3D12_RESOURCE_BARRIER_FLAG_END_ONLY => 2
}
