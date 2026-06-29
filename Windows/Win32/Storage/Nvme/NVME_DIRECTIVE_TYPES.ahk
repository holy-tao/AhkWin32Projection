#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate a type of directive.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_directive_types
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DIRECTIVE_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A directive for an Identify operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_TYPE_IDENTIFY => 0

    /**
     * A directive for a Streams operation.
     * @type {Integer (Int32)}
     */
    static NVME_DIRECTIVE_TYPE_STREAMS => 1
}
