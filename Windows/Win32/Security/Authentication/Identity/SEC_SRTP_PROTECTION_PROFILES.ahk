#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the SRTP protection profiles.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_srtp_protection_profiles
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_SRTP_PROTECTION_PROFILES {
    #StructPack 2

    /**
     * The size (in bytes) of the SRTP protection profiles array.
     */
    ProfilesSize : UInt16

    /**
     * An array of SRTP protection profiles.
     */
    ProfilesList : UInt16[1]

}
