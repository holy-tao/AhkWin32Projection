#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_IDENTIFIER_TYPE extends Win32Enum {

    /**
     * Native name: NVME_IDENTIFIER_TYPE_EUI64
     * @type {Integer (Int32)}
     */
    static EUI64 => 1

    /**
     * Native name: NVME_IDENTIFIER_TYPE_NGUID
     * @type {Integer (Int32)}
     */
    static NGUID => 2

    /**
     * Native name: NVME_IDENTIFIER_TYPE_UUID
     * @type {Integer (Int32)}
     */
    static UUID => 3

    /**
     * Native name: NVME_IDENTIFIER_TYPE_CSI
     * @type {Integer (Int32)}
     */
    static CSI => 4
}
