#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains a value that specifies a directive type sent to an Identify operation.
 * @remarks
 * Use this enumeration to specify values in the **DTYPE** member of the [NVME_CDW11_DIRECTIVE_SEND](ns-nvme-nvme_cdw11_directive_send.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_send_identify_operations
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_SEND_IDENTIFY_OPERATIONS extends Win32Enum{

    /**
     * Indicates whether to send an enable directive to an Identify operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_SEND_IDENTIFY_OPERATION_ENABLE_DIRECTIVE => 1
}
