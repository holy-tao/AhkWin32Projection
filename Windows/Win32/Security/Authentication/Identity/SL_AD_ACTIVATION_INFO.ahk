#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SL_ACTIVATION_INFO_HEADER.ahk" { SL_ACTIVATION_INFO_HEADER }
#Import ".\SL_ACTIVATION_TYPE.ahk" { SL_ACTIVATION_TYPE }

/**
 * Specifies information used for the retail or Active Directory phone activation of a license.
 * @remarks
 * For an example of how this structure is used, see the description of the <i>pActivationInfo</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slactivateproduct">SLActivateProduct</a>, <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-sldepositofflineconfirmationidex">SLDepositOfflineConfirmationIdEx</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgenerateofflineinstallationidex">SLGenerateOfflineInstallationIdEx</a>  functions.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_ad_activation_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SL_AD_ACTIVATION_INFO {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a> structure that contains the activation type.  The activation type determines whether the <b>SL_AD_ACTIVATION_INFO</b> structure is used for retail or Active Directory phone activation.
     */
    header : SL_ACTIVATION_INFO_HEADER

    /**
     * The product key.
     */
    pwszProductKey : PWSTR

    /**
     * The name of the activation object.
     */
    pwszActivationObjectName : PWSTR

}
