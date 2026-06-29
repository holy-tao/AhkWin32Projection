#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_DHCHAP_HASH_ID {
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
    static NvmeofAuthDHCHAPHashReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashSha256 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashSha384 => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashSha512 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHCHAPHashMax => 255
}
