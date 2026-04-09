#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SharedVirtualDiskSupportType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDisksUnsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDisksSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskSnapshotsSupported => 3

    /**
     * @type {Integer (Int32)}
     */
    static SharedVirtualDiskCDPSnapshotsSupported => 7
}
