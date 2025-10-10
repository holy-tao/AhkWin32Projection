#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies access rights assigned to an Active Directory object.
 * @remarks
 * 
  * To assign access rights to an object, set the <b>AccessMask</b> field of an
  *     access-control entry (ACE) to a combination of the constants defined in this enumeration. In addition to the 
  *     <b>AccessMask</b> field, an ACE can have other fields, including 
  *     <b>ACEType</b>, <b>ACEFlags</b>, 
  *     <b>ObjectType</b>, <b>InheritedObjectType</b>, 
  *     <b>Flags</b>, and <b>Trustee</b>. The 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsaccesscontrolentry">IADsAccessControlEntry</a> interface provides property 
  *     methods to obtain and modify these fields.
  * 
  * The <b>ObjectType</b> field specifies a <b>GUID</b> that 
  *     identifies the property set, property, extended right, or type of child object to which the ACE applies. The 
  *     <b>InheritedObjectType</b> field specifies a <b>GUID</b> that 
  *     identifies the type of child object that can inherit the ACE. The <b>Trustee</b> field 
  *     identifies the security principal to whom the ACE allows or denies the specified access rights.
  * 
  * For more information about <b>ACEType</b>, <b>ACEFlags</b>, and 
  *     <b>Flags</b>, see <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_acetype_enum">ADS_ACETYPE_ENUM</a>, 
  *     <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_aceflag_enum">ADS_ACEFLAG_ENUM</a>.
  * 
  * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic 
  *     constants as defined above. Instead, use the numerical constants to set the appropriate flags in your VBScript 
  *     application. To use the symbolic constants as a good programming practice, write explicit declarations of such 
  *     constants, as done here, in your VBScript applications.</div>
  * <div> </div>
  * The specific access rights granted by the four generic rights enumerations 
  *     (<b>ADS_RIGHT_GENERIC_xxx</b>) is dependent on the specific ADSI service provider being 
  *     accessed. For Active Directory, these generic rights are defined in the Ntdsapi.h header file as 
  *     <b>DS_GENERIC_READ</b>, <b>DS_GENERIC_WRITE</b>, 
  *     <b>DS_GENERIC_EXECUTE</b>, and <b>DS_GENERIC_ALL</b>. For more 
  *     information about how to use the  Access Right and Access Masks, see 
  *     <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_rights_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_RIGHTS_ENUM{

    /**
     * The right to delete the object.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DELETE => 65536

    /**
     * The right to read data from the security descriptor of the object, not including the data in the SACL.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_READ_CONTROL => 131072

    /**
     * The right to modify the discretionary access-control list (DACL) in the object security descriptor.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_WRITE_DAC => 262144

    /**
     * The right to assume ownership of the object. The user must be an object trustee. The user cannot transfer the ownership to other users.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_WRITE_OWNER => 524288

    /**
     * The right to use the object for synchronization. This enables a thread to wait until the object is in the signaled state.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_SYNCHRONIZE => 1048576

    /**
     * The right to get or set the SACL in the object security descriptor.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_ACCESS_SYSTEM_SECURITY => 16777216

    /**
     * The right to read permissions on this object, read all the properties on this object, list this object name when the parent container is listed, and list the contents of this object if it is a container.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_GENERIC_READ => -2147483648

    /**
     * The right to read permissions on this object, write all the properties on this object, and perform all validated writes to this object.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_GENERIC_WRITE => 1073741824

    /**
     * The right to read permissions on, and list the contents of,  a container object.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_GENERIC_EXECUTE => 536870912

    /**
     * The right to create or delete child objects, delete a subtree, read and write properties, examine child objects and the object itself, add and remove the object from the directory, and read or write with an extended right.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_GENERIC_ALL => 268435456

    /**
     * The right to create child objects of the object. The <b>ObjectType</b> member of an ACE can contain a <b>GUID</b> that identifies the type of child object whose creation is controlled. If <b>ObjectType</b> does not contain a <b>GUID</b>, the ACE controls the creation of all child object types.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_CREATE_CHILD => 1

    /**
     * The right to delete child objects of the object. The <b>ObjectType</b> member of an ACE can contain a <b>GUID</b> that identifies a type of child object whose deletion is controlled. If <b>ObjectType</b> does not contain a <b>GUID</b>, the ACE controls the deletion of all child object types.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_DELETE_CHILD => 2

    /**
     * The right to list child objects of this object. For more information about this right, see <a href="https://docs.microsoft.com/windows/desktop/AD/controlling-object-visibility">Controlling Object Visibility</a>.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_ACTRL_DS_LIST => 4

    /**
     * The right to perform an operation controlled by a validated write access right. The <b>ObjectType</b> member of an ACE can contain a <b>GUID</b> that identifies the validated write. If <b>ObjectType</b> does not contain a <b>GUID</b>, the ACE controls the rights to perform all valid write operations associated with the object.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_SELF => 8

    /**
     * The right to read properties of the object. The <b>ObjectType</b> member of an ACE can contain a <b>GUID</b> that identifies a property set or property. If <b>ObjectType</b> does not contain a <b>GUID</b>, the ACE controls the right to read all of the object properties.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_READ_PROP => 16

    /**
     * The right to write properties of the object. The <b>ObjectType</b> member of an ACE can contain a <b>GUID</b> that identifies a property set or property. If <b>ObjectType</b> does not contain a <b>GUID</b>, the ACE controls the right to write all of the object properties.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_WRITE_PROP => 32

    /**
     * The right to delete all child objects of this object, regardless of the permissions of the child objects.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_DELETE_TREE => 64

    /**
     * The right to list a particular object. If the user is not granted such a right, and the user does not have <b>ADS_RIGHT_ACTRL_DS_LIST</b> set on the object parent, the object is hidden from the user. This right is ignored if the third character of the <a href="https://docs.microsoft.com/windows/desktop/ADSchema/a-dsheuristics">dSHeuristics</a> property is '0' or not set. For more information, see <a href="https://docs.microsoft.com/windows/desktop/AD/controlling-object-visibility">Controlling Object Visibility</a>.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_LIST_OBJECT => 128

    /**
     * The right to perform an operation controlled by an extended access right. The <b>ObjectType</b> member of an ACE can contain a <b>GUID</b> that identifies the extended right. If <b>ObjectType</b> does not contain a <b>GUID</b>, the ACE controls the right to perform all extended right operations associated with the object.
     * @type {Integer (Int32)}
     */
    static ADS_RIGHT_DS_CONTROL_ACCESS => 256
}
