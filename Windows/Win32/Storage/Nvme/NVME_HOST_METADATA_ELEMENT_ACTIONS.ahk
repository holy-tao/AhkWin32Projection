#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_HOST_METADATA_ELEMENT_ACTIONS extends Win32Enum {

    /**
     * Native name: NVME_HOST_METADATA_ADD_REPLACE_ENTRY
     * @type {Integer (Int32)}
     */
    static ADD_REPLACE_ENTRY => 0

    /**
     * Native name: NVME_HOST_METADATA_DELETE_ENTRY_MULTIPLE
     * @type {Integer (Int32)}
     */
    static DELETE_ENTRY_MULTIPLE => 1

    /**
     * Native name: NVME_HOST_METADATA_ADD_ENTRY_MULTIPLE
     * @type {Integer (Int32)}
     */
    static ADD_ENTRY_MULTIPLE => 2
}
