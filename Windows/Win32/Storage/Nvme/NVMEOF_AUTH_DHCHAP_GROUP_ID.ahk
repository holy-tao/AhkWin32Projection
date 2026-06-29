#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_DHCHAP_GROUP_ID {
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
    static NvmeofAuthDHCHAPGroupNull => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup2048 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup3072 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup4096 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup6144 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroup8192 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPGroupMax => 255
}
