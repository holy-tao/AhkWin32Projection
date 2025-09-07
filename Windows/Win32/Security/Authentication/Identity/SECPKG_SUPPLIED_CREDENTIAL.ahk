#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECPKG_SHORT_VECTOR.ahk
#Include .\SECPKG_BYTE_VECTOR.ahk

/**
 * Specifies the supplied credentials.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_supplied_credential
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_SUPPLIED_CREDENTIAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The length of the header.
     * @type {Integer}
     */
    cbHeaderLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Pay load length, including the header.
     * @type {Integer}
     */
    cbStructureLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The user name for Unicode only.
     * @type {SECPKG_SHORT_VECTOR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := SECPKG_SHORT_VECTOR(this.ptr + 8)
            return this.__UserName
        }
    }

    /**
     * The domain name for Unicode only.
     * @type {SECPKG_SHORT_VECTOR}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := SECPKG_SHORT_VECTOR(this.ptr + 16)
            return this.__DomainName
        }
    }

    /**
     * The credentials in the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_packed_credentials">SEC_WINNT_AUTH_PACKED_CREDENTIALS</a> structure.
     * @type {SECPKG_BYTE_VECTOR}
     */
    PackedCredentials{
        get {
            if(!this.HasProp("__PackedCredentials"))
                this.__PackedCredentials := SECPKG_BYTE_VECTOR(this.ptr + 24)
            return this.__PackedCredentials
        }
    }

    /**
     * The authentication identity flags.
     * @type {Integer}
     */
    CredFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
