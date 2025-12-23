#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_NF_FILE_SYSTEM extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_FILE_SYSTEM_MODIFY => 203

    /**
     * @type {Integer (UInt32)}
     */
    static VDS_NF_FILE_SYSTEM_FORMAT_PROGRESS => 204
}
