#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_DEVICE_TYPE {
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
    static FILE_DEVICE_CD_ROM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DISK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_TAPE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DVD => 51
}
