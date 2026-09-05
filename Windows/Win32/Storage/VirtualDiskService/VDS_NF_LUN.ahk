#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_LUN extends Win32Enum {

    /**
     * Native name: VDS_NF_LUN_ARRIVE
     * @type {Integer (UInt32)}
     */
    static ARRIVE => 108

    /**
     * Native name: VDS_NF_LUN_DEPART
     * @type {Integer (UInt32)}
     */
    static DEPART => 109

    /**
     * Native name: VDS_NF_LUN_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 110
}
