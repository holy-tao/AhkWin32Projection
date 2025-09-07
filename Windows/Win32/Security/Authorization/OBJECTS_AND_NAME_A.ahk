#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a string that identifies a trustee by name and additional strings that identify the object types of an object-specific access control entry (ACE). (ANSI)
 * @remarks
 * The <b>ptstrName</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure can be a pointer to an <b>OBJECTS_AND_NAME</b> structure. This enables functions such as <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setentriesinacla">SetEntriesInAcl</a> and <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getexplicitentriesfromacla">GetExplicitEntriesFromAcl</a> to store object-specific ACE information in the <b>Trustee</b> member of an <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-explicit_access_a">EXPLICIT_ACCESS</a> structure.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The accctrl.h header defines OBJECTS_AND_NAME_ as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-objects_and_name_a
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset ANSI
 */
class OBJECTS_AND_NAME_A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ObjectsPresent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-se_object_type">SE_OBJECT_TYPE</a> enumeration that indicates the type of object.
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A pointer to a null-terminated string that identifies the type of object to which the ACE applies.
     * 
     * This string must be a valid <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LDAP</a> display name in the Active Directory schema.
     * @type {Pointer<Ptr>}
     */
    ObjectTypeName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that identifies the type of object that can inherit the ACE. 
     * 
     * 
     * 
     * 
     * This string must be a valid <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">LDAP</a> display name in the Active Directory schema.
     * 
     * If the ACE_INHERITED_OBJECT_TYPE_PRESENT bit is not set in the <b>ObjectsPresent</b> member, the <b>InheritedObjectTypeName</b> member is ignored, and all types of child objects can inherit the ACE. Otherwise, only the specified object type can inherit the ACE. In either case, inheritance is also controlled by the inheritance flags in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure as well as by any protection against inheritance placed on the child objects.
     * @type {Pointer<Ptr>}
     */
    InheritedObjectTypeName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the trustee.
     * @type {Pointer<Ptr>}
     */
    ptstrName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
