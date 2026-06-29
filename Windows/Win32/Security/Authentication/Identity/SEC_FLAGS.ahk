#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the security flags.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_flags
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_FLAGS {
    #StructPack 8

    /**
     * The caller sets ISC/ASC REQ flags. The lower 32 bits are reserved and must be set to 0.
     */
    Flags : Int64

}
