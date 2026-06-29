#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_FILTER_STREAM_FO_NOTIFICATION_TYPE {
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
    static NotifyTypeCreate => 0

    /**
     * @type {Integer (Int32)}
     */
    static NotifyTypeRetired => 1
}
