#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_BINDING_HANDLE_OPTIONS_FLAGS.ahk" { RPC_BINDING_HANDLE_OPTIONS_FLAGS }

/**
 * Contains additional options with which to create an RPC binding handle.
 * @remarks
 * If this structure is not specified in a call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingcreatea">RpcBindingCreate</a>, the default values for each option are used.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_binding_handle_options_v1
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_BINDING_HANDLE_OPTIONS_V1 {
    #StructPack 4

    /**
     * The version of this structure. For <b>RPC_BINDING_HANDLE_OPTIONS_V1</b> this must be set to 1.
     */
    Version : UInt32

    Flags : RPC_BINDING_HANDLE_OPTIONS_FLAGS

    /**
     * The communication timeout value, specified in microseconds. The default value for RPC is RPC_C_BINDING_DEFAULT_TIMEOUT. This option can be changed later by calling <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcmgmtsetcomtimeout">RpcMgmtSetComTimeout</a>.
     */
    ComTimeout : UInt32

    /**
     * The call timeout value, specified in microseconds. The default value for RPC is 0.
     */
    CallTimeout : UInt32

}
