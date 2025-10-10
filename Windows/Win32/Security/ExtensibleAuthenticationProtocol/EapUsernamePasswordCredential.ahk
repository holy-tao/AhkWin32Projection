#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the username and password that is used by the EAP method for authenticating the user.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eapusernamepasswordcredential
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EapUsernamePasswordCredential extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A NULL-terminated Unicode string that contains the username that needs authentication. The username uses the format user@domain or domain\user.
     * @type {Pointer<Char>}
     */
    username {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A NULL-terminated Unicode string that contains the password to verify the user. The password is encrypted using the [CredProtect](../wincred/nf-wincred-credprotectw.md) function. The EAP method must use the [CredUnprotect](../wincred/nf-wincred-credunprotecta.md) function to retrieve the unencrypted password.
     * @type {Pointer<Char>}
     */
    password {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
