#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about how a device is joined to Microsoft Azure Active Directory.
 * @see https://learn.microsoft.com/windows/win32/api/lmjoin/ns-lmjoin-dsreg_join_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class DSREG_JOIN_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * An enumeration value that specifies the type of the join.
     * @type {Integer}
     */
    joinType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Representations of the certification for the join.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pJoinCertificate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The identifier of the device.
     * @type {PWSTR}
     */
    pszDeviceId{
        get {
            if(!this.HasProp("__pszDeviceId"))
                this.__pszDeviceId := PWSTR(this.ptr + 16)
            return this.__pszDeviceId
        }
    }

    /**
     * A string that represents Azure Active Directory (Azure AD).
     * @type {PWSTR}
     */
    pszIdpDomain{
        get {
            if(!this.HasProp("__pszIdpDomain"))
                this.__pszIdpDomain := PWSTR(this.ptr + 24)
            return this.__pszIdpDomain
        }
    }

    /**
     * The identifier of the joined Azure AD tenant.
     * @type {PWSTR}
     */
    pszTenantId{
        get {
            if(!this.HasProp("__pszTenantId"))
                this.__pszTenantId := PWSTR(this.ptr + 32)
            return this.__pszTenantId
        }
    }

    /**
     * The email address for the joined account.
     * @type {PWSTR}
     */
    pszJoinUserEmail{
        get {
            if(!this.HasProp("__pszJoinUserEmail"))
                this.__pszJoinUserEmail := PWSTR(this.ptr + 40)
            return this.__pszJoinUserEmail
        }
    }

    /**
     * The display name for the joined account.
     * @type {PWSTR}
     */
    pszTenantDisplayName{
        get {
            if(!this.HasProp("__pszTenantDisplayName"))
                this.__pszTenantDisplayName := PWSTR(this.ptr + 48)
            return this.__pszTenantDisplayName
        }
    }

    /**
     * The URL to use to enroll in the Mobile Device Management (MDM) service.
     * @type {PWSTR}
     */
    pszMdmEnrollmentUrl{
        get {
            if(!this.HasProp("__pszMdmEnrollmentUrl"))
                this.__pszMdmEnrollmentUrl := PWSTR(this.ptr + 56)
            return this.__pszMdmEnrollmentUrl
        }
    }

    /**
     * The URL that provides information about the terms of use for the MDM service.
     * @type {PWSTR}
     */
    pszMdmTermsOfUseUrl{
        get {
            if(!this.HasProp("__pszMdmTermsOfUseUrl"))
                this.__pszMdmTermsOfUseUrl := PWSTR(this.ptr + 64)
            return this.__pszMdmTermsOfUseUrl
        }
    }

    /**
     * The URL that provides information about compliance for the MDM service.
     * @type {PWSTR}
     */
    pszMdmComplianceUrl{
        get {
            if(!this.HasProp("__pszMdmComplianceUrl"))
                this.__pszMdmComplianceUrl := PWSTR(this.ptr + 72)
            return this.__pszMdmComplianceUrl
        }
    }

    /**
     * The URL for synchronizing user settings.
     * @type {PWSTR}
     */
    pszUserSettingSyncUrl{
        get {
            if(!this.HasProp("__pszUserSettingSyncUrl"))
                this.__pszUserSettingSyncUrl := PWSTR(this.ptr + 80)
            return this.__pszUserSettingSyncUrl
        }
    }

    /**
     * Information about the user account  that was used to join a device to Azure AD.
     * @type {Pointer<DSREG_USER_INFO>}
     */
    pUserInfo {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
