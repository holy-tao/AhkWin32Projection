#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the information used to connect to a remote computer.
 * @remarks
 * You can set <b>User</b>, <b>Domain</b>, and <b>Password</b> to <b>NULL</b> to use the credentials of the current user.
 * 
 * If you set <b>Password</b>, consider using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function to clear the password after calling <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtopensession">EvtOpenSession</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ns-winevt-evt_rpc_login
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_RPC_LOGIN {
    #StructPack 8

    /**
     * The name of the remote computer to connect to.
     */
    Server : PWSTR

    /**
     * The user name to use to connect to the remote computer.
     */
    User : PWSTR

    /**
     * The domain to which the user account belongs. Optional.
     */
    Domain : PWSTR

    /**
     * The password for the user account.
     */
    Password : PWSTR

    /**
     * The authentication method to use to authenticate the user when connecting to the remote computer. For possible authentication methods, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_rpc_login_flags">EVT_RPC_LOGIN_FLAGS</a> enumeration.
     */
    Flags : UInt32

}
