#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk
#Include .\TOKEN_MANDATORY_POLICY.ahk

/**
 * Specifies all the information in a token that is necessary to perform an access check.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_access_information
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class TOKEN_ACCESS_INFORMATION extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes_hash">SID_AND_ATTRIBUTES_HASH</a> structure that specifies a hash of the token's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID).
     * @type {Pointer<SID_AND_ATTRIBUTES_HASH>}
     */
    SidHash {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes_hash">SID_AND_ATTRIBUTES_HASH</a> structure that specifies a hash of the token's restricted SID.
     * @type {Pointer<SID_AND_ATTRIBUTES_HASH>}
     */
    RestrictedSidHash {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_privileges">TOKEN_PRIVILEGES</a> structure that specifies information about the token's privileges.
     * @type {Pointer<TOKEN_PRIVILEGES>}
     */
    Privileges {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that specifies the token's identity.
     * @type {LUID}
     */
    AuthenticationId{
        get {
            if(!this.HasProp("__AuthenticationId"))
                this.__AuthenticationId := LUID(24, this)
            return this.__AuthenticationId
        }
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-token_type">TOKEN_TYPE</a> enumeration that specifies the token's type.
     * @type {Integer}
     */
    TokenType {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-security_impersonation_level">SECURITY_IMPERSONATION_LEVEL</a> enumeration that specifies the token's impersonation level.
     * @type {Integer}
     */
    ImpersonationLevel {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_mandatory_policy">TOKEN_MANDATORY_POLICY</a> structure that specifies the token's mandatory integrity policy.
     * @type {TOKEN_MANDATORY_POLICY}
     */
    MandatoryPolicy{
        get {
            if(!this.HasProp("__MandatoryPolicy"))
                this.__MandatoryPolicy := TOKEN_MANDATORY_POLICY(40, this)
            return this.__MandatoryPolicy
        }
    }

    /**
     * Reserved. Must be set to zero.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The app container number for the token or zero if this is not an app container token.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This member is not available.
     * @type {Integer}
     */
    AppContainerNumber {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The app container SID or <b>NULL</b> if this is not an app container token.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This member is not available.
     * @type {PSID}
     */
    PackageSid {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes_hash">SID_AND_ATTRIBUTES_HASH</a> structure that specifies a hash of the token's capability SIDs.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>This member is not available.
     * @type {Pointer<SID_AND_ATTRIBUTES_HASH>}
     */
    CapabilitiesHash {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The protected process trust level of the token.
     * @type {PSID}
     */
    TrustLevelSid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Reserved. Must be set to <b>NULL</b>.
     * 
     * <b>Prior to Windows 10:  </b>This member is not available.
     * @type {Pointer<Void>}
     */
    SecurityAttributes {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
