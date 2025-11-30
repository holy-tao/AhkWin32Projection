#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_QOS_CAPABILITIES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_CAPABILITIES_SCHANNEL_FULL_AUTH_IDENTITY => 32
}
