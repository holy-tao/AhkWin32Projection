#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_FABRICS_COMMAND_TYPE extends Win32Enum {

    /**
     * Native name: NVME_FABRICS_COMMAND_PROPERTY_SET
     * @type {Integer (Int32)}
     */
    static PROPERTY_SET => 0

    /**
     * Native name: NVME_FABRICS_COMMAND_CONNECT
     * @type {Integer (Int32)}
     */
    static CONNECT => 1

    /**
     * Native name: NVME_FABRICS_COMMAND_PROPERTY_GET
     * @type {Integer (Int32)}
     */
    static PROPERTY_GET => 4

    /**
     * Native name: NVME_FABRICS_COMMAND_AUTH_SEND
     * @type {Integer (Int32)}
     */
    static AUTH_SEND => 5

    /**
     * Native name: NVME_FABRICS_COMMAND_AUTH_RECV
     * @type {Integer (Int32)}
     */
    static AUTH_RECV => 6

    /**
     * Native name: NVME_FABRICS_COMMAND_DISCONNECT
     * @type {Integer (Int32)}
     */
    static DISCONNECT => 8
}
