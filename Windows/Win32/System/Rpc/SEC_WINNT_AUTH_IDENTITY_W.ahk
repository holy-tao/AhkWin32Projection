#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SEC_WINNT_AUTH_IDENTITY.ahk" { SEC_WINNT_AUTH_IDENTITY }

/**
 * The SEC_WINNT_AUTH_IDENTITY structure enables passing a particular user name and password to the run-time library for the purpose of authentication. The structure is valid for Windows and Macintosh. (Unicode)
 * @remarks
 * This structure must remain valid for the lifetime of the binding handle unless pointed to from the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_http_transport_credentials_a">RPC_HTTP_TRANSPORT_CREDENTIALS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/ns-rpcdce-rpc_http_transport_credentials_v2_a">RPC_HTTP_TRANSPORT_CREDENTIALS_V2</a> structure.
 * 
 * The strings may be ANSI or UNICODE depending on the value assigned to <b>Flags</b>.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_w
 * @namespace Windows.Win32.System.Rpc
 * @charset Unicode
 */
export default struct SEC_WINNT_AUTH_IDENTITY_W {
    #StructPack 8

    /**
     * String containing the user name.
     */
    User : IntPtr

    /**
     * Number of characters in <b>User</b>, excluding the terminating <b>NULL</b>.
     */
    UserLength : UInt32

    /**
     * String containing the domain  or workgroup name.
     */
    Domain : IntPtr

    /**
     * Number of characters in <b>Domain</b>, excluding the terminating <b>NULL</b>.
     */
    DomainLength : UInt32

    /**
     * String containing the user's password in the domain or workgroup.
     */
    Password : IntPtr

    /**
     * Number of characters in <b>Password</b>, excluding the terminating <b>NULL</b>.
     */
    PasswordLength : UInt32

    /**
     * Flags used to specify ANSI or UNICODE. Must be one of the following:
     * 
     * <a id="SEC_WINNT_AUTH_IDENTITY_ANSI"></a>
     * <a id="sec_winnt_auth_identity_ansi"></a>
     */
    Flags : SEC_WINNT_AUTH_IDENTITY

}
