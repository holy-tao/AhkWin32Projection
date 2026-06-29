#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The USERNAME_TARGET_CREDENTIAL_INFO structure contains a reference to a credential.
 * @see https://learn.microsoft.com/windows/win32/api/wincred/ns-wincred-username_target_credential_info
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct USERNAME_TARGET_CREDENTIAL_INFO {
    #StructPack 8

    /**
     * User name of the USERNAME_TARGET_CREDENTIAL_INFO credential.
     */
    UserName : PWSTR

}
