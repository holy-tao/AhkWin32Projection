#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to specify the type of an access-control entry for Active Directory objects.
 * @remarks
 * 
  * A standard ACE is one defined and used in a Windows security descriptor. Windows enables the ACE to be applied to objects and properties identified by GUIDs.
  * 
  * Use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsaccesscontrolentry">IADsAccessControlEntry</a> property method to determine the ACE type.
  * 
  * <div class="alert"><b>Note</b>  Because Visual Basic Scripting Edition (VBScript) cannot read data from a type library, VBScript applications cannot recognize symbolic constants as defined above. Use the numeric constants instead to set the appropriate flags in VBScript applications. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in VBScript applications.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_acetype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_ACETYPE_ENUM{

    /**
     * The ACE is of the standard ACCESS ALLOWED type, where the <b>ObjectType</b> and <b>InheritedObjectType</b> fields are <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_ALLOWED => 0

    /**
     * The ACE is of the standard system-audit type, where the <b>ObjectType</b> and <b>InheritedObjectType</b> fields are <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_DENIED => 1

    /**
     * The ACE is of the standard system type, where the <b>ObjectType</b> and <b>InheritedObjectType</b> fields are <b>NULL</b>.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_AUDIT => 2

    /**
     * The ACE grants access to an object or a subobject of the object, such as a property set or property. <b>ObjectType</b> or <b>InheritedObjectType</b> or both contain a GUID that identifies a property set, property, extended right, or type of child object.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_ALLOWED_OBJECT => 5

    /**
     * The ACE denies access to an object or a subobject of the object, such as a property set or property. <b>ObjectType</b> or <b>InheritedObjectType</b> or both contain a GUID that identifies a property set, property, extended right, or type of child object.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_DENIED_OBJECT => 6

    /**
     * The ACE audits access to an object or a subobject of the object, such as a property set or property. <b>ObjectType</b> or <b>InheritedObjectType</b> or both contain a GUID that identifies a property set, property, extended right, or type of child object.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_AUDIT_OBJECT => 7

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_ALARM_OBJECT => 8

    /**
     * Same functionality as <b>ADS_ACETYPE_ACCESS_ALLOWED</b>, but used with applications that use Authz to verify ACEs.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK => 9

    /**
     * Same functionality as <b>ADS_ACETYPE_ACCESS_DENIED</b>, but used with applications that use Authz to verify ACEs.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_DENIED_CALLBACK => 10

    /**
     * Same functionality as <b>ADS_ACETYPE_ACCESS_ALLOWED_OBJECT</b>, but used with applications that use Authz to verify ACEs.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_ALLOWED_CALLBACK_OBJECT => 11

    /**
     * Same functionality as <b>ADS_ACETYPE_ACCESS_DENIED_OBJECT</b>, but used with applications that use Authz to check ACEs.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_ACCESS_DENIED_CALLBACK_OBJECT => 12

    /**
     * Same functionality as <b>ADS_ACETYPE_SYSTEM_AUDIT</b>, but used with applications that use Authz to check ACEs.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK => 13

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_ALARM_CALLBACK => 14

    /**
     * Same functionality as <b>ADS_ACETYPE_SYSTEM_AUDIT_OBJECT</b>, but used with applications that use Authz to verify ACEs.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_AUDIT_CALLBACK_OBJECT => 15

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static ADS_ACETYPE_SYSTEM_ALARM_CALLBACK_OBJECT => 16
}
