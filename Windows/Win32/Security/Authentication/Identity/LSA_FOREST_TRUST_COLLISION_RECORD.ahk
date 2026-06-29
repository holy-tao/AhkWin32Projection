#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_FOREST_TRUST_COLLISION_RECORD_TYPE.ahk" { LSA_FOREST_TRUST_COLLISION_RECORD_TYPE }

/**
 * Contains information about a Local Security Authority forest trust collision.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_COLLISION_RECORD {
    #StructPack 8

    /**
     * Index of this collision record in the array of <b>LSA_FOREST_TRUST_COLLISION_RECORD</b> structures pointed to by the <b>Entries</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_information">LSA_FOREST_TRUST_COLLISION_INFORMATION</a> structure.
     */
    Index : UInt32

    /**
     * Type of the collision. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CollisionTdo"></a><a id="collisiontdo"></a><a id="COLLISIONTDO"></a><dl>
     * <dt><b>CollisionTdo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Collision between <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CollisionXref"></a><a id="collisionxref"></a><a id="COLLISIONXREF"></a><dl>
     * <dt><b>CollisionXref</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Collision between cross-references.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CollisionOther"></a><a id="collisionother"></a><a id="COLLISIONOTHER"></a><dl>
     * <dt><b>CollisionOther</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Collision that is not a collision between <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/trusteddomain-object">TrustedDomain</a> objects or cross-references.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Type : LSA_FOREST_TRUST_COLLISION_RECORD_TYPE

    /**
     * Flags that provide more information about the collision. The following table lists the possible values for this member when the <b>Type</b> member is CollisionTdo.
     */
    Flags : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the collision record.
     */
    Name : LSA_UNICODE_STRING

}
