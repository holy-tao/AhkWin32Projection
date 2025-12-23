#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFIER_TYPE_LENGTH extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_EUI64_LENGTH => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_NGUID_LENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_UUID_LENGTH => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_IDENTIFIER_TYPE_CSI_LENGTH => 1
}
