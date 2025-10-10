#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a level of dynamic optimization to apply to GPU work that's subsequently submitted.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_background_processing_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_BACKGROUND_PROCESSING_MODE{

    /**
     * The default setting. Specifies that the driver may instrument workloads, and dynamically recompile shaders, in a low overhead, non-intrusive manner that avoids glitching the foreground workload.
     * @type {Integer (Int32)}
     */
    static D3D12_BACKGROUND_PROCESSING_MODE_ALLOWED => 0

    /**
     * Specifies that the driver may instrument as aggressively as possible. The understanding is that causing glitches is fine while in this mode, because the current work is being submitted specifically to train the system.
     * @type {Integer (Int32)}
     */
    static D3D12_BACKGROUND_PROCESSING_MODE_ALLOW_INTRUSIVE_MEASUREMENTS => 1

    /**
     * Specifies that background work should stop. This ensures that background shader recompilation won't consume CPU cycles. Available only in <b>Developer mode</b>.
     * @type {Integer (Int32)}
     */
    static D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_BACKGROUND_WORK => 2

    /**
     * Specifies that all dynamic optimization should be disabled. For example, if you're doing an A/B performance comparison, then using this constant ensures that the driver doesn't change anything that might interfere with your results. Available only in <b>Developer mode</b>.
     * @type {Integer (Int32)}
     */
    static D3D12_BACKGROUND_PROCESSING_MODE_DISABLE_PROFILING_BY_SYSTEM => 3
}
