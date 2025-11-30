#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_csts_shst_shutdown_status
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CSTS_SHST_SHUTDOWN_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CSTS_SHST_NO_SHUTDOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CSTS_SHST_SHUTDOWN_IN_PROCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CSTS_SHST_SHUTDOWN_COMPLETED => 2
}
