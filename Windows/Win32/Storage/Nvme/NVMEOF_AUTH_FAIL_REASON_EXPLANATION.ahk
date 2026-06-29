#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_FAIL_REASON_EXPLANATION {
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
    static NvmeofAuthFailed => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthProtocolNotUsable => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthSecureChannelConcatMismatch => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthHashFunctionNotUsable => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthDHGroupNotUsable => 5

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIncorrectPayload => 6

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIncorrectProtocolMessage => 7
}
