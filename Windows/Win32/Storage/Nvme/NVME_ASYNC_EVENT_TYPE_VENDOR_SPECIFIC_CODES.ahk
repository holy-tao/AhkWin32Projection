#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_CODES {
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
    static NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_DEVICE_PANIC => 1
}
