#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_IOSTATS_CLASS {
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
    static ClsIoStatsDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static ClsIoStatsMax => 65535
}
