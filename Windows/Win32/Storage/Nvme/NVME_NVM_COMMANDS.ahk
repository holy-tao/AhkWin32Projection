#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_nvm_commands
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_NVM_COMMANDS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_FLUSH => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_WRITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_READ => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_WRITE_UNCORRECTABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_COMPARE => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_WRITE_ZEROES => 8

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_DATASET_MANAGEMENT => 9

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_VERIFY => 12

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_RESERVATION_REGISTER => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_RESERVATION_REPORT => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_RESERVATION_ACQUIRE => 17

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_RESERVATION_RELEASE => 21

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_COPY => 25

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_ZONE_MANAGEMENT_SEND => 121

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_ZONE_MANAGEMENT_RECEIVE => 122

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_COMMAND_ZONE_APPEND => 125
}
