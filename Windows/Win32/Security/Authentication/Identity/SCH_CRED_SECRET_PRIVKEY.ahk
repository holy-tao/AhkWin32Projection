#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains private key information needed to authenticate a client or server.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-sch_cred_secret_privkey
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCH_CRED_SECRET_PRIVKEY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Must always be set to SCHANNEL_SECRET_PRIVKEY.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an encrypted private key.
     * @type {Pointer<Integer>}
     */
    pPrivateKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Number of bytes in the encrypted private key.
     * @type {Integer}
     */
    cbPrivateKey {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string that Schannel uses to decrypt the private key.
     * @type {PSTR}
     */
    pszPassword {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
