#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_DRIVE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_ARRIVE => 105

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_DEPART => 106

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_MODIFY => 107

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_DRIVE_REMOVED => 354
}
