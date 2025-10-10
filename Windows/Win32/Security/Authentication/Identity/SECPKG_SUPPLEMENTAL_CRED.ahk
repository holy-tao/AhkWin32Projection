#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * The SECPKG_SUPPLEMENTAL_CRED structure contains supplemental credentials recognized by the security package.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_supplemental_cred
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_SUPPLEMENTAL_CRED extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">authentication package</a> that authenticated the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">credentials</a>.
     * @type {LSA_UNICODE_STRING}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__PackageName
        }
    }

    /**
     * The size of the <b>Credentials</b> member, in bytes.
     * @type {Integer}
     */
    CredentialSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a set of package-specific supplemental credentials.
     * @type {Pointer<Byte>}
     */
    Credentials {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
