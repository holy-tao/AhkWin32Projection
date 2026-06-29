#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SecPkgContext_Authority structure contains the name of the authenticating authority if one is available. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SecPkgContext_Authority as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_authoritya
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct SecPkgContext_AuthorityA {
    #StructPack 8

    /**
     * Pointer to a null-terminated string containing the name of the authenticating authority, if available.
     */
    sAuthorityName : IntPtr

}
