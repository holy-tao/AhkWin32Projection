#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_CONTROLLER extends Win32Enum {

    /**
     * Native name: VDS_NF_CONTROLLER_ARRIVE
     * @type {Integer (UInt32)}
     */
    static ARRIVE => 103

    /**
     * Native name: VDS_NF_CONTROLLER_DEPART
     * @type {Integer (UInt32)}
     */
    static DEPART => 104

    /**
     * Native name: VDS_NF_CONTROLLER_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 350

    /**
     * Native name: VDS_NF_CONTROLLER_REMOVED
     * @type {Integer (UInt32)}
     */
    static REMOVED => 351
}
