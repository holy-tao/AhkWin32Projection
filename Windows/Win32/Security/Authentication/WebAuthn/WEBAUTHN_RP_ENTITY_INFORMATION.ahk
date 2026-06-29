#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Information about the Relying Party.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_rp_entity_information
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_RP_ENTITY_INFORMATION {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * Identifier for the Relying Party. This field is required.
     */
    pwszId : PWSTR

    /**
     * Contains the friendly name of the Relying Party, such as "Acme Corporation", "Widgets Inc", or "Contoso". This field is required.
     */
    pwszName : PWSTR

    /**
     * Optional URL pointing to the Relying Party's logo.
     */
    pwszIcon : PWSTR

}
