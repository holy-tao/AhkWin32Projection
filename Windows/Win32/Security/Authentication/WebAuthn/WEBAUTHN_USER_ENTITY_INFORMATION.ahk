#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Information about a user entity.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_user_entity_information
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_USER_ENTITY_INFORMATION {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The size of **pbId**.
     */
    cbId : UInt32

    /**
     * Identifier for the user. This field is required.
     */
    pbId : IntPtr

    /**
     * Contains a detailed name for this account, such as "john.p.smith@example.com".
     */
    pwszName : PWSTR

    /**
     * Optional URL that can be used to retrieve an image containing the user's current avatar or a data URI that contains the image data.
     */
    pwszIcon : PWSTR

    /**
     * Contains the friendly name associated with the user account by the Relying Party, such as "John P. Smith".
     */
    pwszDisplayName : PWSTR

}
