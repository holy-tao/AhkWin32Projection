#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_DISC_CTRL_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeDDC => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeCDC => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeReserved1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeDiscCtrlTypeReservedMax => 255
}
