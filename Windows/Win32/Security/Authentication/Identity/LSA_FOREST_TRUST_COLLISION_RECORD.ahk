#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about a Local Security Authority forest trust collision.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_record
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_FOREST_TRUST_COLLISION_RECORD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Index of this collision record in the array of <b>LSA_FOREST_TRUST_COLLISION_RECORD</b> structures pointed to by the <b>Entries</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_collision_information">LSA_FOREST_TRUST_COLLISION_INFORMATION</a> structure.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Flags that provide more information about the collision. The following table lists the possible values for this member when the <b>Type</b> member is CollisionTdo.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the collision record.
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__Name
        }
    }
}
