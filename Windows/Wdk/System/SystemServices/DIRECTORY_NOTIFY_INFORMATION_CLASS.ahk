#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DIRECTORY_NOTIFY_INFORMATION_CLASS {
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
    static DirectoryNotifyInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyExtendedInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyFullInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static DirectoryNotifyMaximumInformation => 4
}
