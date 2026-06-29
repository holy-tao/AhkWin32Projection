#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the security package's object identifier (OID).
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_serialized_oid
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SERIALIZED_OID {
    #StructPack 4

    /**
     * The length of the OID.
     */
    OidLength : UInt32

    /**
     * The attributes of the OID.
     */
    OidAttributes : UInt32

    /**
     * The value of the OID. The value of SECPKG_MAX_OID_LENGTH is currently set to 32.
     */
    OidValue : Int8[32]

}
