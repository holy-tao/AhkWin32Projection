#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify what should be done with the results of earlier workload instrumentation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_measurements_action
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MEASUREMENTS_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The default setting. Specifies that all results should be kept.
     * @type {Integer (Int32)}
     */
    static D3D12_MEASUREMENTS_ACTION_KEEP_ALL => 0

    /**
     * Specifies that the driver has seen all the data that it's ever going to, so it should stop waiting for more and go ahead compiling optimized shaders.
     * @type {Integer (Int32)}
     */
    static D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS => 1

    /**
     * Like <b>D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS</b>, but also specifies that your application doesn't care about glitches, so the runtime should ignore the usual idle priority rules and go ahead using as many threads as possible to get shader recompiles done fast. Available only in <b>Developer mode</b>.
     * @type {Integer (Int32)}
     */
    static D3D12_MEASUREMENTS_ACTION_COMMIT_RESULTS_HIGH_PRIORITY => 2

    /**
     * Specifies that the optimization state should be reset; hinting that whatever has previously been measured no longer applies.
     * @type {Integer (Int32)}
     */
    static D3D12_MEASUREMENTS_ACTION_DISCARD_PREVIOUS => 3
}
