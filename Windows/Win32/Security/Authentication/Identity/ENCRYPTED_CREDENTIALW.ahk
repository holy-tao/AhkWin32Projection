#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\FILETIME.ahk
#Include ..\..\Credentials\CREDENTIALW.ahk

/**
 * Represents an encrypted credential.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-encrypted_credentialw
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class ENCRYPTED_CREDENTIALW extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure that contains the encrypted credential.
     * @type {CREDENTIALW}
     */
    Cred{
        get {
            if(!this.HasProp("__Cred"))
                this.__Cred := CREDENTIALW(0, this)
            return this.__Cred
        }
    }

    /**
     * The size, in bytes, of the unencrypted credential.
     * @type {Integer}
     */
    ClearCredentialBlobSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
