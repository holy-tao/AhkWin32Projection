#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * The SecPkgCredentials_SSIProvider structure holds the SSI provider information associated with a context. The QueryCredentialsAttributes function uses this structure. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The sspi.h header defines SecPkgCredentials_SSIProvider as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcredentials_ssiprovidera
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 * @charset ANSI
 */
class SecPkgCredentials_SSIProviderA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the name of the provider represented by the credential.
     * @type {Pointer<SByte>}
     */
    sProviderName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Length of the provider information.
     * @type {Integer}
     */
    ProviderInfoLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The provider information.
     * @type {PSTR}
     */
    ProviderInfo{
        get {
            if(!this.HasProp("__ProviderInfo"))
                this.__ProviderInfo := PSTR(this.ptr + 16)
            return this.__ProviderInfo
        }
    }
}
