#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of collision that can occur between Local Security Authority forest trust records.
 * @remarks
 * 
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record">LSA_FOREST_TRUST_COLLISION_RECORD</a> structure.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-lsa_forest_trust_collision_record_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_COLLISION_RECORD_TYPE extends Win32Enum{

    /**
     * Collision between <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> objects. This indicates a collision with a namespace element of another forest.
     * @type {Integer (Int32)}
     */
    static CollisionTdo => 0

    /**
     * Collision between cross-references. This indicates a collision with a domain in the same forest.
     * @type {Integer (Int32)}
     */
    static CollisionXref => 1

    /**
     * Collision that is not a collision between <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> objects or cross-references.
     * @type {Integer (Int32)}
     */
    static CollisionOther => 2
}
