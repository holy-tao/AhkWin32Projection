#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\TRUSTED_DOMAIN_INFORMATION_EX2.ahk
#Include .\TRUSTED_POSIX_OFFSET_INFO.ahk
#Include .\TRUSTED_DOMAIN_AUTH_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_FULL_INFORMATION2 extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {TRUSTED_DOMAIN_INFORMATION_EX2}
     */
    Information{
        get {
            if(!this.HasProp("__Information"))
                this.__Information := TRUSTED_DOMAIN_INFORMATION_EX2(0, this)
            return this.__Information
        }
    }

    /**
     * @type {TRUSTED_POSIX_OFFSET_INFO}
     */
    PosixOffset{
        get {
            if(!this.HasProp("__PosixOffset"))
                this.__PosixOffset := TRUSTED_POSIX_OFFSET_INFO(64, this)
            return this.__PosixOffset
        }
    }

    /**
     * @type {TRUSTED_DOMAIN_AUTH_INFORMATION}
     */
    AuthInformation{
        get {
            if(!this.HasProp("__AuthInformation"))
                this.__AuthInformation := TRUSTED_DOMAIN_AUTH_INFORMATION(72, this)
            return this.__AuthInformation
        }
    }
}
