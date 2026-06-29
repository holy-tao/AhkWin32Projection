#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS {
    #StructPack 4

    dwVersion : UInt32

    lUp : Int32

    lUv : Int32

    lRequireResidentKey : Int32

}
