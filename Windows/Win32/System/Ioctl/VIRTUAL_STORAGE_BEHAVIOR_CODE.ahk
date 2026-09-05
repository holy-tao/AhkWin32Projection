#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class VIRTUAL_STORAGE_BEHAVIOR_CODE extends Win32Enum {

    /**
     * Native name: VirtualStorageBehaviorUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: VirtualStorageBehaviorCacheWriteThrough
     * @type {Integer (Int32)}
     */
    static CacheWriteThrough => 1

    /**
     * Native name: VirtualStorageBehaviorCacheWriteBack
     * @type {Integer (Int32)}
     */
    static CacheWriteBack => 2

    /**
     * Native name: VirtualStorageBehaviorStopIoProcessing
     * @type {Integer (Int32)}
     */
    static StopIoProcessing => 3

    /**
     * Native name: VirtualStorageBehaviorRestartIoProcessing
     * @type {Integer (Int32)}
     */
    static RestartIoProcessing => 4
}
