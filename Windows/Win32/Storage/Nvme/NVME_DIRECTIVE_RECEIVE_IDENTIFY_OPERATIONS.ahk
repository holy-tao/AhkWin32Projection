#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a value that specifies a directive type for an Identify operation.
 * @remarks
 * Use this enumeration to specify values in the **DTYPE** member of the [NVME_CDW11_DIRECTIVE_RECEIVE](ns-nvme-nvme_cdw11_directive_receive.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_receive_identify_operations
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_RECEIVE_IDENTIFY_OPERATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a directive to receive return parameters from an Identify operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_RECEIVE_IDENTIFY_OPERATION_RETURN_PARAMETERS => 1
}
