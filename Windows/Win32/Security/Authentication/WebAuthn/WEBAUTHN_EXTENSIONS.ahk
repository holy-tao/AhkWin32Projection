#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_EXTENSION.ahk" { WEBAUTHN_EXTENSION }

/**
 * Contains a list of extensions.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_extensions
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_EXTENSIONS {
    #StructPack 8

    /**
     * The size of **pExtensions**.
     */
    cExtensions : UInt32

    /**
     * The list of extensions.
     */
    pExtensions : WEBAUTHN_EXTENSION.Ptr

}
