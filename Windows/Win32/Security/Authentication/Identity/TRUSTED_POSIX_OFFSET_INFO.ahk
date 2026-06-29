#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to query or set the value used to generate Posix user and group identifiers.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_posix_offset_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_POSIX_OFFSET_INFO {
    #StructPack 4

    /**
     * An offset that the system uses to generate Posix user and group identifiers that correspond to a given SID. To generate a Posix identifier, the system adds the RID from the SID to the Posix offset of the trusted domain identified by the SID.
     */
    Offset : UInt32

}
