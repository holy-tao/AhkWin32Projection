#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_ID {
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
    static NvmeofAuthIdNegotiate => 0

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIdChallenge => 1

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIdReply => 2

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIdSuccess1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIdSuccess2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIdFailure2 => 240

    /**
     * @type {Integer (Int32)}
     */
    static NvmeofAuthIdFailure1 => 241
}
