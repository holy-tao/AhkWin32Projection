#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\SID.ahk" { SID }
#Import "..\SYSTEM_AUDIT_OBJECT_ACE_FLAGS.ahk" { SYSTEM_AUDIT_OBJECT_ACE_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains a security identifier (SID) that identifies a trustee and GUIDs that identify the object types of an object-specific access control entry (ACE).
 * @remarks
 * The <b>ptstrName</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure can be a pointer to an <b>OBJECTS_AND_SID</b> structure. This enables functions such as <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setentriesinacla">SetEntriesInAcl</a> and <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getexplicitentriesfromacla">GetExplicitEntriesFromAcl</a> to store object-specific ACE information in the <b>Trustee</b> member of an <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure.
 * 
 * When you use this structure in a call to <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setentriesinacla">SetEntriesInAcl</a>, <b>ObjectTypeGuid</b> and <b>InheritedObjectTypeGuid</b> must be valid schema identifiers in the Active Directory schema. The system does not verify the GUIDs; they are used as is.
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-objects_and_sid
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct OBJECTS_AND_SID {
    #StructPack 8

    ObjectsPresent : SYSTEM_AUDIT_OBJECT_ACE_FLAGS

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object, property set, or property protected by the ACE. If this ACE is inherited, the GUID identifies the type of object, property set, or property protected by the inherited ACE. This GUID must be a valid schema identifier in the Active Directory schema.
     * 
     * If the ACE_OBJECT_TYPE_PRESENT bit is not set in the <b>ObjectsPresent</b> member, the <b>ObjectTypeGuid</b> member is ignored, and the ACE protects the object to which the ACL is assigned.
     */
    ObjectTypeGuid : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object that can inherit the ACE. This GUID must be a valid schema identifier in the Active Directory schema.
     * 
     * If the ACE_INHERITED_OBJECT_TYPE_PRESENT bit is not set in the <b>ObjectsPresent</b> member, the <b>InheritedObjectTypeGuid</b> member is ignored, and all types of child objects can inherit the ACE. Otherwise, only the specified object type can inherit the ACE. In either case, inheritance is also controlled by the inheritance flags in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure as well as by any protection against inheritance placed on the child objects.
     */
    InheritedObjectTypeGuid : Guid

    /**
     * A pointer to the SID of the trustee to whom the ACE applies.
     */
    pSid : SID.Ptr

}
