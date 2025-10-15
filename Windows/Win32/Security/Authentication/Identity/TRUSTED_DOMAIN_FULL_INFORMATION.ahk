#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk
#Include .\TRUSTED_DOMAIN_INFORMATION_EX.ahk
#Include .\TRUSTED_POSIX_OFFSET_INFO.ahk
#Include .\TRUSTED_DOMAIN_AUTH_INFORMATION.ahk

/**
 * Used to retrieve complete information about a trusted domain.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-trusted_domain_full_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_FULL_INFORMATION extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure containing extended information for a trusted domain.
     * @type {TRUSTED_DOMAIN_INFORMATION_EX}
     */
    Information{
        get {
            if(!this.HasProp("__Information"))
                this.__Information := TRUSTED_DOMAIN_INFORMATION_EX(this.ptr + 0)
            return this.__Information
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_posix_offset_info">TRUSTED_POSIX_OFFSET_INFO</a> structure containing the value used to generate Posix user and group identifiers for a trusted domain.
     * @type {TRUSTED_POSIX_OFFSET_INFO}
     */
    PosixOffset{
        get {
            if(!this.HasProp("__PosixOffset"))
                this.__PosixOffset := TRUSTED_POSIX_OFFSET_INFO(this.ptr + 56)
            return this.__PosixOffset
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information">TRUSTED_DOMAIN_AUTH_INFORMATION</a> structure containing authentication information for a trusted domain.
     * @type {TRUSTED_DOMAIN_AUTH_INFORMATION}
     */
    AuthInformation{
        get {
            if(!this.HasProp("__AuthInformation"))
                this.__AuthInformation := TRUSTED_DOMAIN_AUTH_INFORMATION(this.ptr + 64)
            return this.__AuthInformation
        }
    }
}
