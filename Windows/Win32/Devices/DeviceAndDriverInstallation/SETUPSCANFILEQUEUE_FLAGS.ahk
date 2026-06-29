#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SETUPSCANFILEQUEUE_FLAGS {
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
    static SPQ_SCAN_FILE_PRESENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_VALIDITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_CALLBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_CALLBACKEX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_INFORM_USER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_PRUNE_COPY_QUEUE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_CALLBACK_SIGNERINFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_PRUNE_DELREN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_PRESENCE_WITHOUT_SOURCE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_COMPARISON => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_ACTIVATE_DRP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_OEM_CATALOGS => 2048
}
