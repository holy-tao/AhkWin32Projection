#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Authenticate against the HTTP Proxy. This value is uncommon.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_http_transport_credentials_a
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_HTTP_AUTHN_TARGET extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_TARGET_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_TARGET_PROXY => 2
}
