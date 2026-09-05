#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate a priority which can be assigned to an I/O Submission Queue for consideration by an arbitration mechanism if one is supported by the controller.
 * @remarks
 * Use this enumeration to specify values in the **QPRIO** field of the [NVME_CDW11_CREATE_IO_SQ](ns-nvme-nvme_cdw11_create_io_sq.md) structure that is used in the [Create IO Submission Queue (CREATEIOSQ)](ns-nvme-nvme_command.md) Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_nvm_queue_priorities
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_NVM_QUEUE_PRIORITIES extends Win32Enum {

    /**
     * The queue has an urgent priority.
     * Native name: NVME_NVM_QUEUE_PRIORITY_URGENT
     * @type {Integer (Int32)}
     */
    static PRIORITY_URGENT => 0

    /**
     * The queue has a high priority.
     * Native name: NVME_NVM_QUEUE_PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static PRIORITY_HIGH => 1

    /**
     * The queue has a medium priority.
     * Native name: NVME_NVM_QUEUE_PRIORITY_MEDIUM
     * @type {Integer (Int32)}
     */
    static PRIORITY_MEDIUM => 2

    /**
     * The queue has a low priority.
     * Native name: NVME_NVM_QUEUE_PRIORITY_LOW
     * @type {Integer (Int32)}
     */
    static PRIORITY_LOW => 3
}
