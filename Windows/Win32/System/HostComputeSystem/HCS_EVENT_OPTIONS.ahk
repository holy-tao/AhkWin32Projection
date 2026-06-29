#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HCS_EVENT_OPTIONS
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT_OPTIONS
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_EVENT_OPTIONS {
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
    static HcsEventOptionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionEnableOperationCallbacks => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionEnableVmLifecycle => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOptionEnableLiveMigrationEvents => 4
}
