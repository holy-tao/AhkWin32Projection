#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate a directive type for a Streams operation.
 * @remarks
 * Use this enumeration to specify values in the **DTYPE** member of the [NVME_CDW11_DIRECTIVE_RECEIVE](ns-nvme-nvme_cdw11_directive_receive.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_receive_streams_operations
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A directive to receive return parameters from a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_RETURN_PARAMETERS => 1

    /**
     * A directive to get status from a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_GET_STATUS => 2

    /**
     * A directive to allocate resources for a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_STREAMS_OPERATION_ALLOCATE_RESOURCES => 3
}
