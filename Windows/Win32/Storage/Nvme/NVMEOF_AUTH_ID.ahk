#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_AUTH_ID{

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
