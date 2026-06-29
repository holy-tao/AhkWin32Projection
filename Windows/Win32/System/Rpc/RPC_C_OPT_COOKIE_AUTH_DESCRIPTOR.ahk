#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR structure contains a cookie that is inserted into the header of RPC/HTTP traffic.
 * @remarks
 * A pointer to this structure is passed as the OptionValue when making a call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetoption">RpcBindingSetOption</a>  with <a href="https://docs.microsoft.com/windows/desktop/Rpc/binding-option-constants">RPC_C_OPT_COOKIE_AUTH</a>  as the option.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdcep/ns-rpcdcep-rpc_c_opt_cookie_auth_descriptor
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR {
    #StructPack 8

    /**
     * The length, in bytes, of <b>Buffer</b>.
     */
    BufferSize : UInt32

    /**
     * A null-terminated string that contains the cookie.
     */
    Buffer : PSTR

}
