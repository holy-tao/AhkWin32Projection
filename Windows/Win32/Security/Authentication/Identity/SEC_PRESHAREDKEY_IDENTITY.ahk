#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the identity for a pre-shared key.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_presharedkey_identity
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_PRESHAREDKEY_IDENTITY {
    #StructPack 2

    /**
     * The size (in bytes) of the PSK identity.
     */
    KeyIdentitySize : UInt16

    /**
     * The PSK identity.
     */
    KeyIdentity : Int8[1]

}
