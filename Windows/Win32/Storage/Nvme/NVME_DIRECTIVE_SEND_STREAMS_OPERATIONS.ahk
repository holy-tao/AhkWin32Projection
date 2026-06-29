#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate a directive type sent to a Streams operation.
 * @remarks
 * Use this enumeration to specify values in the **DTYPE** member of the [NVME_CDW11_DIRECTIVE_SEND](ns-nvme-nvme_cdw11_directive_send.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_send_streams_operations
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_SEND_STREAMS_OPERATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
