#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SharedVirtualDiskHandleState extends Win32Enum {

    /**
     * Native name: SharedVirtualDiskHandleStateNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: SharedVirtualDiskHandleStateFileShared
     * @type {Integer (Int32)}
     */
    static FileShared => 1

    /**
     * Native name: SharedVirtualDiskHandleStateHandleShared
     * @type {Integer (Int32)}
     */
    static HandleShared => 3
}
