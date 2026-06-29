#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_SECURE_CHANNEL {
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
    static NvmeofAuthSCUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthSCAuthRequired => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthSCAuthConcatSCRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthSCReserved => 3
}
