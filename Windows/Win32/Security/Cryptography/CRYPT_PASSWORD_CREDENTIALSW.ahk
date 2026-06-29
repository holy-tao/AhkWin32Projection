#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the user name and password credentials to be used in the CRYPT_CREDENTIALS structure as optional input to a remote object retrieval function such as CryptRetrieveObjectByUrl or CryptGetTimeValidObject. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wincrypt.h header defines CRYPT_PASSWORD_CREDENTIALS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_password_credentialsw
 * @namespace Windows.Win32.Security.Cryptography
 * @charset Unicode
 */
export default struct CRYPT_PASSWORD_CREDENTIALSW {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated string that contains the user name credential for the remote session authentication.
     */
    pszUsername : PWSTR

    /**
     * A pointer to a null-terminated string that contains the password credential for the remote session authentication.
     */
    pszPassword : PWSTR

}
