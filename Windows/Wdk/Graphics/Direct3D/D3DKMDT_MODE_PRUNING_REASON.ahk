#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MODE_PRUNING_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_ALLCAPS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_DESCRIPTOR_MONITOR_SOURCE_MODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_DESCRIPTOR_MONITOR_FREQUENCY_RANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_DESCRIPTOR_OVERRIDE_MONITOR_SOURCE_MODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_DESCRIPTOR_OVERRIDE_MONITOR_FREQUENCY_RANGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_DEFAULT_PROFILE_MONITOR_SOURCE_MODE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_DRIVER_RECOMMENDED_MONITOR_SOURCE_MODE => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_MONITOR_FREQUENCY_RANGE_OVERRIDE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_CLONE_PATH_PRUNED => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MPR_MAXVALID => 10
}
