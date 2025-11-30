#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_fused_operation_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FUSED_OPERATION_CODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FUSED_OPERATION_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FUSED_OPERATION_FIRST_CMD => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FUSED_OPERATION_SECOND_CMD => 2
}
