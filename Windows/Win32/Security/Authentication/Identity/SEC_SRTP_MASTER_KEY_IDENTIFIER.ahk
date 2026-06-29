#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the SRTP master key identifier.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_srtp_master_key_identifier
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_SRTP_MASTER_KEY_IDENTIFIER {
    #StructPack 1

    /**
     * The size (in bytes) of the SRTP master key identifier.
     */
    MasterKeyIdentifierSize : Int8

    /**
     * The SRTP master key identifier.
     */
    MasterKeyIdentifier : Int8[1]

}
