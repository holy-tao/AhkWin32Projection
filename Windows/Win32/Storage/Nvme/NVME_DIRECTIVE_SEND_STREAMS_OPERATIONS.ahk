#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate a directive type sent to a Streams operation.
 * @remarks
 * Use this enumeration to specify values in the **DTYPE** member of the [NVME_CDW11_DIRECTIVE_SEND](ns-nvme-nvme_cdw11_directive_send.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_send_streams_operations
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_SEND_STREAMS_OPERATIONS{

    /**
     * A release identifier directive sent to a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_SEND_STREAMS_OPERATION_RELEASE_IDENTIFIER => 1

    /**
     * A release resources directive sent to a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_SEND_STREAMS_OPERATION_RELEASE_RESOURCES => 2
}
