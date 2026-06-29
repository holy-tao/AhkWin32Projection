#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_COLLECTION_TYPEIDE_NOTIFICATION_TYPE {
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
    static TCCollectionBugCheck => 1

    /**
     * @type {Integer (Int32)}
     */
    static TCCollectionApplicationRequested => 2

    /**
     * @type {Integer (Int32)}
     */
    static TCCollectionDeviceRequested => 3
}
