#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
     * @type {Pointer<PWSTR>}
     */
    pszDeviceId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A string that represents Azure Active Directory (Azure AD).
     * @type {Pointer<PWSTR>}
     */
    pszIdpDomain {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The identifier of the joined Azure AD tenant.
     * @type {Pointer<PWSTR>}
     */
    pszTenantId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The email address for the joined account.
     * @type {Pointer<PWSTR>}
     */
    pszJoinUserEmail {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The display name for the joined account.
     * @type {Pointer<PWSTR>}
     */
    pszTenantDisplayName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The URL to use to enroll in the Mobile Device Management (MDM) service.
     * @type {Pointer<PWSTR>}
     */
    pszMdmEnrollmentUrl {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The URL that provides information about the terms of use for the MDM service.
     * @type {Pointer<PWSTR>}
     */
    pszMdmTermsOfUseUrl {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The URL that provides information about compliance for the MDM service.
     * @type {Pointer<PWSTR>}
     */
    pszMdmComplianceUrl {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The URL for synchronizing user settings.
     * @type {Pointer<PWSTR>}
     */
    pszUserSettingSyncUrl {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
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
