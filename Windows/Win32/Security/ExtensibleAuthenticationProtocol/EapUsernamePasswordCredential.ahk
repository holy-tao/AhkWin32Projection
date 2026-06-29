#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the username and password that is used by the EAP method for authenticating the user.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eapusernamepasswordcredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapUsernamePasswordCredential {
    #StructPack 8

    /**
     * A NULL-terminated Unicode string that contains the username that needs authentication. The username uses the format user@domain or domain\user.
     */
    username : PWSTR

    /**
     * A NULL-terminated Unicode string that contains the password to verify the user. The password is encrypted using the [CredProtect](../wincred/nf-wincred-credprotectw.md) function. The EAP method must use the [CredUnprotect](../wincred/nf-wincred-credunprotecta.md) function to retrieve the unencrypted password.
     */
    password : PWSTR

}
