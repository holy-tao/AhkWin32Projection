#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Allows you to pass a particular user name and password to the run-time library for the purpose of authentication. (Unicode)
 * @remarks
 * When this structure is used with RPC, the structure must remain valid for the lifetime of the binding handle.
 * 
 * The strings may be ANSI or Unicode, depending on the value you assign to the <b>Flags</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_w
 * @namespace Windows.Win32.System.Rpc
 */
export default struct SEC_WINNT_AUTH_IDENTITY {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_ANSI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_WINNT_AUTH_IDENTITY_UNICODE => 2
}
