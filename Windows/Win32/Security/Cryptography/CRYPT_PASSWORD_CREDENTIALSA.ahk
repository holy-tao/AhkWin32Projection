#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the user name and password credentials to be used in the CRYPT_CREDENTIALS structure as optional input to a remote object retrieval function such as CryptRetrieveObjectByUrl or CryptGetTimeValidObject.
 * @remarks
 * 
  * > [!NOTE]
  * > The wincrypt.h header defines CRYPT_PASSWORD_CREDENTIALS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_password_credentialsa
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 * @charset ANSI
 */
class CRYPT_PASSWORD_CREDENTIALSA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that contains the user name credential for the remote session authentication.
     * @type {PSTR}
     */
    pszUsername {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that contains the password credential for the remote session authentication.
     * @type {PSTR}
     */
    pszPassword {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
