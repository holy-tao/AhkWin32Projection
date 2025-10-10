#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR structure contains a cookie that is inserted into the header of RPC/HTTP traffic.
 * @remarks
 * 
  * A pointer to this structure is passed as the OptionValue when making a call to <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-rpcbindingsetoption">RpcBindingSetOption</a>  with <a href="https://docs.microsoft.com/windows/desktop/Rpc/binding-option-constants">RPC_C_OPT_COOKIE_AUTH</a>  as the option.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rpcdcep/ns-rpcdcep-rpc_c_opt_cookie_auth_descriptor
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length, in bytes, of <b>Buffer</b>.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A null-terminated string that contains the cookie.
     * @type {Pointer<Byte>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
