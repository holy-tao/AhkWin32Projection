#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_C_QOS_CAPABILITIES extends Win32BitflagEnum {

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 0

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH
     * @type {Integer (UInt32)}
     */
    static MUTUAL_AUTH => 1

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC
     * @type {Integer (UInt32)}
     */
    static MAKE_FULLSIC => 2

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY
     * @type {Integer (UInt32)}
     */
    static ANY_AUTHORITY => 4

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE
     * @type {Integer (UInt32)}
     */
    static IGNORE_DELEGATE_FAILURE => 8

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT
     * @type {Integer (UInt32)}
     */
    static LOCAL_MA_HINT => 16

    /**
     * Native name: RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY
     * @type {Integer (UInt32)}
     */
    static SCHANNEL_FULL_AUTH_IDENTITY => 32
}
