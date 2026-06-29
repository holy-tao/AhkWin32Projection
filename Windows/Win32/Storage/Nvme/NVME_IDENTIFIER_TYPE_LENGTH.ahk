#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFIER_TYPE_LENGTH {
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
    static NVME_IDENTIFIER_TYPE_EUI64_LENGTH => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_NGUID_LENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_UUID_LENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_CSI_LENGTH => 1
}
