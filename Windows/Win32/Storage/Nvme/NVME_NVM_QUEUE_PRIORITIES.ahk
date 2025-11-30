#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_nvm_queue_priorities
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_NVM_QUEUE_PRIORITIES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_URGENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_HIGH => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_MEDIUM => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_NVM_QUEUE_PRIORITY_LOW => 3
}
