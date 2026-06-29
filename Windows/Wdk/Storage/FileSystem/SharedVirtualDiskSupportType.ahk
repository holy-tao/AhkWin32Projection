#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SharedVirtualDiskSupportType {
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
    static SharedVirtualDisksUnsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDisksSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskSnapshotsSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskCDPSnapshotsSupported => 7
}
