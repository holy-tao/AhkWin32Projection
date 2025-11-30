#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SharedVirtualDiskHandleState extends Win32Enum{

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
