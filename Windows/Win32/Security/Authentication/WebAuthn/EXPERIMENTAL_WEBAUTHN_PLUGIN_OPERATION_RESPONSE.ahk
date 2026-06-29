#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_PLUGIN_OPERATION_RESPONSE {
    #StructPack 8

    cbEncodedResponse : UInt32

    pbEncodedResponse : IntPtr

}
