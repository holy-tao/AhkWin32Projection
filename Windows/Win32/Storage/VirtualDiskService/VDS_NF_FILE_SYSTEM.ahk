#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_NF_FILE_SYSTEM extends Win32Enum {

    /**
     * Native name: VDS_NF_FILE_SYSTEM_MODIFY
     * @type {Integer (UInt32)}
     */
    static MODIFY => 203

    /**
     * Native name: VDS_NF_FILE_SYSTEM_FORMAT_PROGRESS
     * @type {Integer (UInt32)}
     */
    static FORMAT_PROGRESS => 204
}
