#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_FABRICS_COMMAND_TYPE {
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
    static NVME_FABRICS_COMMAND_PROPERTY_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_CONNECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_PROPERTY_GET => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_AUTH_SEND => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_AUTH_RECV => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_DISCONNECT => 8
}
