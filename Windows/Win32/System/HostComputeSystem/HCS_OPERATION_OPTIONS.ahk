#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_OPERATION_OPTIONS {
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
    static HcsOperationOptionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationOptionProgressUpdate => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsOperationOptionReserved1 => 2
}
