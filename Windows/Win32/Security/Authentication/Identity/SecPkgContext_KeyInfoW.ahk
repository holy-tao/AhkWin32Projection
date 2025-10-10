#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_KeyInfo structure contains information about the session keys used in a security context.
 * @remarks
 * 
  * > [!NOTE]
  * > The sspi.h header defines SecPkgContext_KeyInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_keyinfow
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset Unicode
 */
class SecPkgContext_KeyInfoW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the name, if available, of the algorithm used for generating signatures, for example "MD5" or "SHA-2".
     * @type {Pointer<UInt16>}
     */
    sSignatureAlgorithmName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that contains the name, if available, of the algorithm used for encrypting messages. Reserved for future use.
     * @type {Pointer<UInt16>}
     */
    sEncryptAlgorithmName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the effective key length, in bits, for the session key. This is typically 40, 56, or 128 bits.
     * @type {Integer}
     */
    KeySize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the algorithm identifier (<a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a>) used for generating signatures, if available.
     * @type {Integer}
     */
    SignatureAlgorithm {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the algorithm identifier (<a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a>) used for encrypting messages. Reserved for future use.
     * @type {Integer}
     */
    EncryptAlgorithm {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
