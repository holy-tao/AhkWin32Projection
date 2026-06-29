#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about an extension.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_extension
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_EXTENSION {
    #StructPack 8

    /**
     * The extension identifier.
     */
    pwszExtensionIdentifier : PWSTR

    /**
     * The size of **pvExtension**.
     */
    cbExtension : UInt32

    /**
     * The extension data.
     */
    pvExtension : IntPtr

}
