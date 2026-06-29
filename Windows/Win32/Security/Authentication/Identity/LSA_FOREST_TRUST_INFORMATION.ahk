#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_FOREST_TRUST_RECORD.ahk" { LSA_FOREST_TRUST_RECORD }

/**
 * Contains Local Security Authority forest trust information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_INFORMATION {
    #StructPack 8

    RecordCount : UInt32

    /**
     * Pointer to a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_record">LSA_FOREST_TRUST_RECORD</a> structures, each of which contains one piece of forest trust information.
     */
    Entries : IntPtr

}
