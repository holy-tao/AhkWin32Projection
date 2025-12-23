#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_CONTROLLER extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_ARRIVE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_DEPART => 104

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_MODIFY => 350

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_CONTROLLER_REMOVED => 351
}
