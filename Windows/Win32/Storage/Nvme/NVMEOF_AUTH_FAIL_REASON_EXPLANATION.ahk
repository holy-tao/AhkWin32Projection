#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVMEOF_AUTH_FAIL_REASON_EXPLANATION extends Win32Enum {

    /**
     * Native name: NvmeofAuthFailed
     * @type {Integer (Int32)}
     */
    static Failed => 1

    /**
     * Native name: NvmeofAuthProtocolNotUsable
     * @type {Integer (Int32)}
     */
    static ProtocolNotUsable => 2

    /**
     * Native name: NvmeofAuthSecureChannelConcatMismatch
     * @type {Integer (Int32)}
     */
    static SecureChannelConcatMismatch => 3

    /**
     * Native name: NvmeofAuthHashFunctionNotUsable
     * @type {Integer (Int32)}
     */
    static HashFunctionNotUsable => 4

    /**
     * Native name: NvmeofAuthDHGroupNotUsable
     * @type {Integer (Int32)}
     */
    static AuthDHGroupNotUsable => 5

    /**
     * Native name: NvmeofAuthIncorrectPayload
     * @type {Integer (Int32)}
     */
    static IncorrectPayload => 6

    /**
     * Native name: NvmeofAuthIncorrectProtocolMessage
     * @type {Integer (Int32)}
     */
    static IncorrectProtocolMessage => 7
}
