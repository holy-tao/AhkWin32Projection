#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_AUDIT_OBJECT_ACE_FLAGS.ahk" { SYSTEM_AUDIT_OBJECT_ACE_FLAGS }
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * The SYSTEM_AUDIT_CALLBACK_OBJECT_ACE structure defines an access control entry for a system access control list.
 * @remarks
 * If neither the <b>ObjectType</b> nor <b>InheritedObjectType</b> GUID is specified, the <b>SYSTEM_AUDIT_CALLBACK_OBJECT_ACE</b> structure has the same semantics as the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_audit_callback_ace">SYSTEM_AUDIT_CALLBACK_ACE</a> structure. In that case, use the 
 * <b>SYSTEM_AUDIT_CALLBACK_ACE</b> structure because it is smaller and more efficient.
 * 
 * An ACL that contains a <b>SYSTEM_AUDIT_CALLBACK_OBJECT_ACE</b> structure must specify the ACL_REVISION_DS revision number in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure.
 * 
 * When a <b>SYSTEM_AUDIT_CALLBACK_OBJECT_ACE</b> structure is created, sufficient memory must be allocated to accommodate the GUID structures in <b>ObjectType</b> and <b>InheritedObjectType</b> members, if one or both of them exists, as well as to accommodate the complete SID of the trustee in the <b>SidStart</b> member and the contiguous memory that follows it.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_audit_callback_object_ace
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_AUDIT_CALLBACK_OBJECT_ACE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It contains flags that control inheritance of the ACE by child objects. The structure also contains flags that indicate whether the ACE audits successful access attempts, failed access attempts, or both. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to SYSTEM_AUDIT_CALLBACK_OBJECT_ACE_TYPE, and the <b>AceSize</b> member should be set to the total number of bytes allocated for the <b>SYSTEM_AUDIT_CALLBACK_OBJECT_ACE</b> structure.
     */
    Header : ACE_HEADER

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that specifies the access rights the system will audit for access attempts by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a>.
     */
    Mask : UInt32

    Flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies a property set, property, extended right, or type of child object. 
     * 
     * 
     * 
     * 
     * This member is valid only if the ACE_OBJECT_TYPE_PRESENT bit is set in the <b>Flags</b> member. Otherwise, <b>ObjectType</b> is ignored.
     * 
     * The purpose of this GUID depends on the access rights specified in the <b>Mask</b> member.
     */
    ObjectType : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of child object that can inherit the ACE. 
     * 
     * 
     * 
     * 
     * This member is valid only if the ACE_INHERITED_OBJECT_TYPE_PRESENT bit is set in the <b>Flags</b> member. If that bit is not set, <b>InheritedObjectType</b> is ignored and all types of child objects can inherit the ACE. In either case, inheritance is also controlled by the inheritance flags in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a>, as well as by any protection against inheritance placed on the child objects.
     */
    InheritedObjectType : Guid

    /**
     * The first <b>DWORD</b> of a trustee's SID. The remaining bytes of the SID  are stored in contiguous memory after the <b>SidStart</b> member. This SID can be appended with application data.
     */
    SidStart : UInt32

}
