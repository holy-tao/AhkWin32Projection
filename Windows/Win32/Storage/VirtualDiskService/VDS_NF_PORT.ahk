#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_PORT extends Win32Enum {

    /**
     * Native name: VDS_NF_PORT_ARRIVE
     * @type {Integer (UInt32)}
     */
    static ARRIVE => 121

    /**
     * Native name: VDS_NF_PORT_DEPART
     * @type {Integer (UInt32)}
     */
    static DEPART => 122

    /**
     * Native name: VDS_NF_PORT_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 352

    /**
     * Native name: VDS_NF_PORT_REMOVED
     * @type {Integer (UInt32)}
     */
    static REMOVED => 353
}
