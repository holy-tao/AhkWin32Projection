#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SL_ACTIVATION_INFO_HEADER.ahk

/**
 * Specifies information used for the retail or Active Directory phone activation of a license.
 * @remarks
 * 
 * For an example of how this structure is used, see the description of the <i>pActivationInfo</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slactivateproduct">SLActivateProduct</a>, <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-sldepositofflineconfirmationidex">SLDepositOfflineConfirmationIdEx</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slgenerateofflineinstallationidex">SLGenerateOfflineInstallationIdEx</a>  functions.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//slpublic/ns-slpublic-sl_ad_activation_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SL_AD_ACTIVATION_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ns-slpublic-sl_activation_info_header">SL_ACTIVATION_INFO_HEADER</a> structure that contains the activation type.  The activation type determines whether the <b>SL_AD_ACTIVATION_INFO</b> structure is used for retail or Active Directory phone activation.
     * @type {SL_ACTIVATION_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := SL_ACTIVATION_INFO_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * The product key.
     * @type {PWSTR}
     */
    pwszProductKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The name of the activation object.
     * @type {PWSTR}
     */
    pwszActivationObjectName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
