#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SharedVirtualDiskHandleState{

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskHandleStateNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskHandleStateFileShared => 1

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskHandleStateHandleShared => 3
}
