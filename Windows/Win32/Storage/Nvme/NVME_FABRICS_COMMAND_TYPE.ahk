#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FABRICS_COMMAND_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_PROPERTY_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_CONNECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_PROPERTY_GET => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_AUTH_SEND => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_AUTH_RECV => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FABRICS_COMMAND_DISCONNECT => 8
}
