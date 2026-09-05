#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_DRIVE extends Win32Enum {

    /**
     * Native name: VDS_NF_DRIVE_ARRIVE
     * @type {Integer (UInt32)}
     */
    static ARRIVE => 105

    /**
     * Native name: VDS_NF_DRIVE_DEPART
     * @type {Integer (UInt32)}
     */
    static DEPART => 106

    /**
     * Native name: VDS_NF_DRIVE_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 107

    /**
     * Native name: VDS_NF_DRIVE_REMOVED
     * @type {Integer (UInt32)}
     */
    static REMOVED => 354
}
