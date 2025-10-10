#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies fence options.
 * @remarks
 * 
  * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createfence">ID3D12Device::CreateFence</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_fence_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FENCE_FLAGS{

    /**
     * No options are specified.
     * @type {Integer (Int32)}
     */
    static D3D12_FENCE_FLAG_NONE => 0

    /**
     * The fence is shared.
     * @type {Integer (Int32)}
     */
    static D3D12_FENCE_FLAG_SHARED => 1

    /**
     * The fence is shared with another GPU adapter.
     * @type {Integer (Int32)}
     */
    static D3D12_FENCE_FLAG_SHARED_CROSS_ADAPTER => 2

    /**
     * The fence is of the non-monitored type. Non-monitored fences should only be used when the adapter doesn't support monitored fences, or when a fence is shared with an adapter that doesn't support monitored fences.
     * @type {Integer (Int32)}
     */
    static D3D12_FENCE_FLAG_NON_MONITORED => 4
}
