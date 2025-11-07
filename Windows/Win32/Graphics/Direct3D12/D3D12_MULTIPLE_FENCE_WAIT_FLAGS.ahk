#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies multiple wait flags for multiple fences.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device1-seteventonmultiplefencecompletion">SetEventOnMultipleFenceCompletion</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_multiple_fence_wait_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_MULTIPLE_FENCE_WAIT_FLAGS{

    /**
     * No flags are being passed. This means to use the default behavior, which is to wait for all fences before signaling the event.
     * @type {Integer (Int32)}
     */
    static D3D12_MULTIPLE_FENCE_WAIT_FLAG_NONE => 0

    /**
     * Modifies behavior to indicate that the event should be signaled after any one of the fence values has been reached by its corresponding fence.
     * @type {Integer (Int32)}
     */
    static D3D12_MULTIPLE_FENCE_WAIT_FLAG_ANY => 1

    /**
     * An alias for **D3D12_MULTIPLE_FENCE_WAIT_FLAG_NONE**, meaning to use the default behavior and wait for all fences.
     * @type {Integer (Int32)}
     */
    static D3D12_MULTIPLE_FENCE_WAIT_FLAG_ALL => 0
}
