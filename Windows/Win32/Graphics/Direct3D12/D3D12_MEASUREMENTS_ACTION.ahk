#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify what should be done with the results of earlier workload instrumentation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_measurements_action
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_MEASUREMENTS_ACTION extends Win32Enum {

    /**
     * The default setting. Specifies that all results should be kept.
     * Native name: D3D12_MEASUREMENTS_ACTION_KEEP_ALL
     * @type {Integer (Int32)}
     */
    static KEEP_ALL => 0

    /**
     * Specifies that the driver has seen all the data that it's ever going to, so it should stop waiting for more and go ahead compiling optimized shaders.
     * Native name: D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS
     * @type {Integer (Int32)}
     */
    static COMMIT_RESULTS => 1

    /**
     * Like <b>D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS</b>, but also specifies that your application doesn't care about glitches, so the runtime should ignore the usual idle priority rules and go ahead using as many threads as possible to get shader recompiles done fast. Available only in <b>Developer mode</b>.
     * Native name: D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS_HIGH_PRIORITY
     * @type {Integer (Int32)}
     */
    static COMMIT_RESULTS_HIGH_PRIORITY => 2

    /**
     * Specifies that the optimization state should be reset; hinting that whatever has previously been measured no longer applies.
     * Native name: D3D12_MEASUREMENTS_ACTION_DISCARD_PREVIOUS
     * @type {Integer (Int32)}
     */
    static DISCARD_PREVIOUS => 3
}
