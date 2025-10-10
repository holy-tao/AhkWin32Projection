#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgCredentials_Names structure holds the name of the user associated with a context. The QueryCredentialsAttributes function uses this structure.
 * @remarks
 * 
  * > [!NOTE]
  * > The sspi.h header defines SecPkgCredentials_Names as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcredentials_namesa
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SecPkgCredentials_NamesA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated string containing the name of the user represented by the credential. If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a> sets the SECPKG_FLAG_ACCEPT_WIN32_NAME flag to indicate that it can process Windows names, this name can be used in other Windows calls.
     * @type {Pointer<SByte>}
     */
    sUserName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
