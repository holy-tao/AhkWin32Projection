#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFIER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_EUI64 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_NGUID => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_UUID => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_CSI => 4
}
