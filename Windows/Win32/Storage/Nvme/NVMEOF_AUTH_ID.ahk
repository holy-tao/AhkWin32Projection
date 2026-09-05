#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_AUTH_ID extends Win32Enum {

    /**
     * Native name: NvmeofAuthIdNegotiate
     * @type {Integer (Int32)}
     */
    static Negotiate => 0

    /**
     * Native name: NvmeofAuthIdChallenge
     * @type {Integer (Int32)}
     */
    static Challenge => 1

    /**
     * Native name: NvmeofAuthIdReply
     * @type {Integer (Int32)}
     */
    static Reply => 2

    /**
     * Native name: NvmeofAuthIdSuccess1
     * @type {Integer (Int32)}
     */
    static Success1 => 3

    /**
     * Native name: NvmeofAuthIdSuccess2
     * @type {Integer (Int32)}
     */
    static Success2 => 4

    /**
     * Native name: NvmeofAuthIdFailure2
     * @type {Integer (Int32)}
     */
    static Failure2 => 240

    /**
     * Native name: NvmeofAuthIdFailure1
     * @type {Integer (Int32)}
     */
    static Failure1 => 241
}
