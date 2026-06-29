#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_RESPONSE {
    #StructPack 8

    cbOpSignPubKey : UInt32

    pbOpSignPubKey : IntPtr

}
