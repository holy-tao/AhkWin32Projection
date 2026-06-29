#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VIRTUAL_STORAGE_BEHAVIOR_CODE {
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
    static VirtualStorageBehaviorUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static VirtualStorageBehaviorCacheWriteThrough => 1

    /**
     * @type {Integer (Int32)}
     */
    static VirtualStorageBehaviorCacheWriteBack => 2

    /**
     * @type {Integer (Int32)}
     */
    static VirtualStorageBehaviorStopIoProcessing => 3

    /**
     * @type {Integer (Int32)}
     */
    static VirtualStorageBehaviorRestartIoProcessing => 4
}
