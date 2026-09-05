#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_DISK extends Win32Enum {

    /**
     * Native name: VDS_NF_DISK_ARRIVE
     * @type {Integer (UInt32)}
     */
    static ARRIVE => 8

    /**
     * Native name: VDS_NF_DISK_DEPART
     * @type {Integer (UInt32)}
     */
    static DEPART => 9

    /**
     * Native name: VDS_NF_DISK_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 10
}
