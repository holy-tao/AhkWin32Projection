#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_SHARE_DISPOSITION {
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
    static CmResourceShareUndetermined => 0

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareDeviceExclusive => 1

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareDriverExclusive => 2

    /**
     * @type {Integer (Int32)}
     */
    static CmResourceShareShared => 3
}
