#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_IDENTIFIER_TYPE_LENGTH extends Win32Enum {

    /**
     * Native name: NVME_IDENTIFIER_TYPE_EUI64_LENGTH
     * @type {Integer (Int32)}
     */
    static EUI64_LENGTH => 8

    /**
     * Native name: NVME_IDENTIFIER_TYPE_NGUID_LENGTH
     * @type {Integer (Int32)}
     */
    static NGUID_LENGTH => 16

    /**
     * Native name: NVME_IDENTIFIER_TYPE_UUID_LENGTH
     * @type {Integer (Int32)}
     */
    static UUID_LENGTH => 16

    /**
     * Native name: NVME_IDENTIFIER_TYPE_CSI_LENGTH
     * @type {Integer (Int32)}
     */
    static CSI_LENGTH => 1
}
