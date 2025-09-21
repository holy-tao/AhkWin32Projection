#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRMID.ahk

/**
 * Used by DRMCreateBoundLicense to bind to a license.
 * @remarks
 * In a C++ application, this structure has a default constructor that initializes the members to the following values.
  * 
  * 
  * ```cpp
  * uVersion = DRMBOUNDLICENSEPARAMSVERSION
  * hEnablingPrincipal = NULL
  * hSecureStore = NULL
  * wszRightsRequested = NULL
  * wszRightsGroup = NULL
  * cAuthenticatorCount = 0
  * rghAuthenticators = NULL
  * wszDefaultEnablingPrincipalCredentials = NULL
  * idResource.uVersion = DRMIDVERSION
  * idResource.wszIDType = NULL
  * idResource.wszID = NULL
  * dwFlags = 0
  * ```
  * 
  * 
  * If there is more than one rights group in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a>, the <i>wszRightsGroup</i> parameter specifies the name of the rights group to use. By default, the first rights group found in the end-user license is chosen. If any one of the requested rights is not granted, the bind request (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a>) will fail.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ns-msdrmdefs-drmboundlicenseparams
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMBOUNDLICENSEPARAMS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Specifies the version of the structure. This member should be set to <b>DRMBOUNDLICENSEPARAMSVERSION</b>.
     * @type {Integer}
     */
    uVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to an enabling principal in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a> that should be bound. Create this handle by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function. The default for this member is <b>NULL</b>. If <b>NULL</b> is used, the application will bind to the first principal in the license.
     * @type {Integer}
     */
    hEnablingPrincipal {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved for future use. This member must be set to <b>NULL</b>.
     * @type {Integer}
     */
    hSecureStore {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains a comma-delimited list of the rights requested. This member cannot be <b>NULL</b>, and the string must contain valid rights such as EDIT and OWNER.
     * @type {Pointer<Char>}
     */
    wszRightsRequested {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the rights group to use in the license; for more information, see Remarks. This member can be set to <b>NULL</b> if it is not used.
     * @type {Pointer<Char>}
     */
    wszRightsGroup {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmid">DRMID</a> structure that identifies the content to which you are trying to bind. You must set the <i>wszID</i> and <i>wszIDType</i> parameters of this structure to the  values you  specified in the <i>wszContentId</i> and <i>wszContentIdType</i> parameters, respectively, in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. If the values are <b>NULL</b> or they do not match the corresponding values in <b>DRMSetMetaData</b>,  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> function returns an error.
     * @type {DRMID}
     */
    idResource{
        get {
            if(!this.HasProp("__idResource"))
                this.__idResource := DRMID(this.ptr + 32)
            return this.__idResource
        }
    }

    /**
     * Reserved for future use. This member must be set to zero.
     * @type {Integer}
     */
    cAuthenticatorCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Reserved for future use. This member must be set to <b>NULL</b>.
     * @type {Pointer<UInt32>}
     */
    rghAuthenticators {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the certificate for the enabling principal (the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a>). This member can be set to <b>NULL</b> if it is not used.
     * @type {Pointer<Char>}
     */
    wszDefaultEnablingPrincipalCredentials {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Optional. Contains flags for additional settings. This member can be zero or the following value.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
