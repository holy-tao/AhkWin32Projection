#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_FOREST_TRUST_COLLISION_RECORD.ahk" { LSA_FOREST_TRUST_COLLISION_RECORD }

/**
 * Contains information about Local Security Authority forest trust collisions.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_COLLISION_INFORMATION {
    #StructPack 8

    /**
     * Number of <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record">LSA_FOREST_TRUST_COLLISION_RECORD</a> structures in the array pointed to by the <b>Entries</b> member.
     */
    RecordCount : UInt32

    /**
     * Pointer to a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record">LSA_FOREST_TRUST_COLLISION_RECORD</a> structures, each of which contains information about a single collision.
     */
    Entries : IntPtr

}
