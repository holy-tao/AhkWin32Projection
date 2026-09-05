#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class SharedVirtualDiskSupportType extends Win32Enum {

    /**
     * Native name: SharedVirtualDisksUnsupported
     * @type {Integer (Int32)}
     */
    static DisksUnsupported => 0

    /**
     * Native name: SharedVirtualDisksSupported
     * @type {Integer (Int32)}
     */
    static DisksSupported => 1

    /**
     * Native name: SharedVirtualDiskSnapshotsSupported
     * @type {Integer (Int32)}
     */
    static SnapshotsSupported => 3

    /**
     * Native name: SharedVirtualDiskCDPSnapshotsSupported
     * @type {Integer (Int32)}
     */
    static DiskCDPSnapshotsSupported => 7
}
