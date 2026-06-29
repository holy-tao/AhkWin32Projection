#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The SecPkgCredentials_SSIProvider structure holds the SSI provider information associated with a context. The QueryCredentialsAttributes function uses this structure. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The sspi.h header defines SecPkgCredentials_SSIProvider as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcredentials_ssiprovidera
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @charset ANSI
 */
export default struct SecPkgCredentials_SSIProviderA {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that contains the name of the provider represented by the credential.
     */
    sProviderName : IntPtr

    /**
     * Length of the provider information.
     */
    ProviderInfoLength : UInt32

    /**
     * The provider information.
     */
    ProviderInfo : PSTR

}
