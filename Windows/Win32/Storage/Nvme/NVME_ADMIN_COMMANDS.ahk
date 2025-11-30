#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_admin_commands
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ADMIN_COMMANDS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DELETE_IO_SQ => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_CREATE_IO_SQ => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_GET_LOG_PAGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DELETE_IO_CQ => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_CREATE_IO_CQ => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_IDENTIFY => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_ABORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SET_FEATURES => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_GET_FEATURES => 10

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_ASYNC_EVENT_REQUEST => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NAMESPACE_MANAGEMENT => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FIRMWARE_ACTIVATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FIRMWARE_COMMIT => 16

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FIRMWARE_IMAGE_DOWNLOAD => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DEVICE_SELF_TEST => 20

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NAMESPACE_ATTACHMENT => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_KEEP_ALIVE => 24

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DIRECTIVE_SEND => 25

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DIRECTIVE_RECEIVE => 26

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_VIRTUALIZATION_MANAGEMENT => 28

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NVME_MI_SEND => 29

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_NVME_MI_RECEIVE => 30

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DISCOVERY_INFO_MGMT => 33

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_DOORBELL_BUFFER_CONFIG => 124

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FABRICS => 127

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_FORMAT_NVM => 128

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SECURITY_SEND => 129

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SECURITY_RECEIVE => 130

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_SANITIZE => 132

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ADMIN_COMMAND_GET_LBA_STATUS => 134
}
