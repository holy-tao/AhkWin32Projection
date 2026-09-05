#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_NO_DEALLOCATE_MODIFIES_MEDIA_AFTER_SANITIZE extends Win32Enum {

    /**
     * Native name: NVME_MEDIA_ADDITIONALLY_MODIFIED_AFTER_SANITIZE_NOT_DEFINED
     * @type {Integer (Int32)}
     */
    static ADDITIONALLY_MODIFIED_AFTER_SANITIZE_NOT_DEFINED => 0

    /**
     * Native name: NVME_MEDIA_NOT_ADDITIONALLY_MODIFIED_AFTER_SANITIZE
     * @type {Integer (Int32)}
     */
    static NOT_ADDITIONALLY_MODIFIED_AFTER_SANITIZE => 1

    /**
     * Native name: NVME_MEDIA_ADDITIONALLY_MOFIDIED_AFTER_SANITIZE
     * @type {Integer (Int32)}
     */
    static ADDITIONALLY_MOFIDIED_AFTER_SANITIZE => 2
}
