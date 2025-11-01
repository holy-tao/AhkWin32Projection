#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about Local Security Authority forest trust collisions.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_COLLISION_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record">LSA_FOREST_TRUST_COLLISION_RECORD</a> structures in the array pointed to by the <b>Entries</b> member.
     * @type {Integer}
     */
    RecordCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record">LSA_FOREST_TRUST_COLLISION_RECORD</a> structures, each of which contains information about a single collision.
     * @type {Pointer<Pointer<LSA_FOREST_TRUST_COLLISION_RECORD>>}
     */
    Entries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
