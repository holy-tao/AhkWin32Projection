#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_RUNS_IN_PROCESS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RUNS_IN_NON_SYSTEM_OR_NOT_RUNNING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RUNS_IN_SYSTEM_PROCESS => 1
}
