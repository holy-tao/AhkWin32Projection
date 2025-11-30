#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_HOST_METADATA_ELEMENT_ACTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_HOST_METADATA_ADD_REPLACE_ENTRY => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_HOST_METADATA_DELETE_ENTRY_MULTIPLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_HOST_METADATA_ADD_ENTRY_MULTIPLE => 2
}
