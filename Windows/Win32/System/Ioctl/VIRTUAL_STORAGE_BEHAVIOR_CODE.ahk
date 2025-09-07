#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class VIRTUAL_STORAGE_BEHAVIOR_CODE{

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
