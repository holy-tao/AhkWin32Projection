#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRMID.ahk" { DRMID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

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
 */
export default struct DRMBOUNDLICENSEPARAMS {
    #StructPack 8

    /**
     * Specifies the version of the structure. This member should be set to <b>DRMBOUNDLICENSEPARAMSVERSION</b>.
     */
    uVersion : UInt32

    /**
     * A handle to an enabling principal in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/e-gly">end-user license</a> that should be bound. Create this handle by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateenablingprincipal">DRMCreateEnablingPrincipal</a> function. The default for this member is <b>NULL</b>. If <b>NULL</b> is used, the application will bind to the first principal in the license.
     */
    hEnablingPrincipal : UInt32

    /**
     * Reserved for future use. This member must be set to <b>NULL</b>.
     */
    hSecureStore : UInt32

    /**
     * A pointer to a null-terminated Unicode string that contains a comma-delimited list of the rights requested. This member cannot be <b>NULL</b>, and the string must contain valid rights such as EDIT and OWNER.
     */
    wszRightsRequested : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the rights group to use in the license; for more information, see Remarks. This member can be set to <b>NULL</b> if it is not used.
     */
    wszRightsGroup : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ns-msdrmdefs-drmid">DRMID</a> structure that identifies the content to which you are trying to bind. You must set the <i>wszID</i> and <i>wszIDType</i> parameters of this structure to the  values you  specified in the <i>wszContentId</i> and <i>wszContentIdType</i> parameters, respectively, in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmsetmetadata">DRMSetMetaData</a> function. If the values are <b>NULL</b> or they do not match the corresponding values in <b>DRMSetMetaData</b>,  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateboundlicense">DRMCreateBoundLicense</a> function returns an error.
     */
    idResource : DRMID

    /**
     * Reserved for future use. This member must be set to zero.
     */
    cAuthenticatorCount : UInt32

    /**
     * Reserved for future use. This member must be set to <b>NULL</b>.
     */
    rghAuthenticators : IntPtr

    /**
     * A pointer to a null-terminated Unicode string that contains the certificate for the enabling principal (the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/r-gly">rights account certificate</a>). This member can be set to <b>NULL</b> if it is not used.
     */
    wszDefaultEnablingPrincipalCredentials : PWSTR

    /**
     * Optional. Contains flags for additional settings. This member can be zero or the following value.
     */
    dwFlags : UInt32

}
