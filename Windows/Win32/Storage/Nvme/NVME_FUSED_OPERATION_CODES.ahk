#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate whether a command is the first or second command in a fused operation.
 * @remarks
 * Use this enumeration to specify values in the **FUSE** field of the [NVME_COMMAND_DWORD0](ns-nvme-nvme_command_dword0.md) structure to indicate whether a command is part of a fused operation.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_fused_operation_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FUSED_OPERATION_CODES extends Win32Enum{

    /**
     * A normal operation without fusing commands.
     * @type {Integer (Int32)}
     */
    static NVME_FUSED_OPERATION_NORMAL => 0

    /**
     * The first command in a fused operation.
     * @type {Integer (Int32)}
     */
    static NVME_FUSED_OPERATION_FIRST_CMD => 1

    /**
     * The second command in a fused operation.
     * @type {Integer (Int32)}
     */
    static NVME_FUSED_OPERATION_SECOND_CMD => 2
}
