#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct PLUGIN_TYPE {
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
    static UNKNOWN_PLUGIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_PLUGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static RESOURCE_PLUGIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static LOAD_BALANCING_PLUGIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static PLACEMENT_PLUGIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static ORCHESTRATION_PLUGIN => 16

    /**
     * @type {Integer (Int32)}
     */
    static PROVISIONING_PLUGIN => 32

    /**
     * @type {Integer (Int32)}
     */
    static TASK_PLUGIN => 64
}
