#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_SERIALIZED_OID.ahk" { SECPKG_SERIALIZED_OID }

/**
 * Contains the object identifiers (OIDs) for the extended security package.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_extra_oids
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_EXTRA_OIDS {
    #StructPack 4

    /**
     * The total number of OIDs in the security package.
     */
    OidCount : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_serialized_oid">SECPKG_SERIALIZED_OID</a> structure containing the OID data.
     */
    Oids : SECPKG_SERIALIZED_OID[1]

}
