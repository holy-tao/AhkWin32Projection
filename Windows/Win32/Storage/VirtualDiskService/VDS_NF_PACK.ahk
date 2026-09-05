#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_PACK extends Win32Enum {

    /**
     * Native name: VDS_NF_PACK_ARRIVE
     * @type {Integer (UInt32)}
     */
    static ARRIVE => 1

    /**
     * Native name: VDS_NF_PACK_DEPART
     * @type {Integer (UInt32)}
     */
    static DEPART => 2

    /**
     * Native name: VDS_NF_PACK_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 3
}
