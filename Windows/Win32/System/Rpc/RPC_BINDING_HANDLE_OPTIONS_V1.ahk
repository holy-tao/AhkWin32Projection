#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains additional options with which to create an RPC binding handle.
 * @remarks
 * 
 * If this structure is not specified in a call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingcreatea">RpcBindingCreate</a>, the default values for each option are used.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//rpcdce/ns-rpcdce-rpc_binding_handle_options_v1
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_BINDING_HANDLE_OPTIONS_V1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The version of this structure. For <b>RPC_BINDING_HANDLE_OPTIONS_V1</b> this must be set to 1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The communication timeout value, specified in microseconds. The default value for RPC is RPC_C_BINDING_DEFAULT_TIMEOUT. This option can be changed later by calling <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtsetcomtimeout">RpcMgmtSetComTimeout</a>.
     * @type {Integer}
     */
    ComTimeout {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The call timeout value, specified in microseconds. The default value for RPC is 0.
     * @type {Integer}
     */
    CallTimeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
