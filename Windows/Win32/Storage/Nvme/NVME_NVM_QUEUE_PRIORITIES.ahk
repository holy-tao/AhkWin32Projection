#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate a priority which can be assigned to an I/O Submission Queue for consideration by an arbitration mechanism if one is supported by the controller.
 * @remarks
 * Use this enumeration to specify values in the **QPRIO** field of the [NVME_CDW11_CREATE_IO_SQ](ns-nvme-nvme_cdw11_create_io_sq.md) structure that is used in the [Create IO Submission Queue (CREATEIOSQ)](ns-nvme-nvme_command.md) Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_nvm_queue_priorities
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_NVM_QUEUE_PRIORITIES{

    /**
     * The queue has an urgent priority.
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_URGENT => 0

    /**
     * The queue has a high priority.
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_HIGH => 1

    /**
     * The queue has a medium priority.
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_MEDIUM => 2

    /**
     * The queue has a low priority.
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_LOW => 3
}
