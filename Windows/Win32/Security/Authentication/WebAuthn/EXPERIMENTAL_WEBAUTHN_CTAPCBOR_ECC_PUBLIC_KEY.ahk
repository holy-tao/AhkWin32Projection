#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_ECC_PUBLIC_KEY {
    #StructPack 8

    dwVersion : UInt32

    lKty : Int32

    lAlg : Int32

    lCrv : Int32

    cbX : UInt32

    pbX : IntPtr

    cbY : UInt32

    pbY : IntPtr

}
