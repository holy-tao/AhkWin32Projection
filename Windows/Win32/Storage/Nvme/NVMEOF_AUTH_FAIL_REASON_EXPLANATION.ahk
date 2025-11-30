#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_AUTH_FAIL_REASON_EXPLANATION extends Win32Enum{

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
