#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines what component of the security descriptor that the EventAccessControl function modifies.
 * @remarks
 * For information on DACLs and SACLs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-lists">Access Control Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ne-evntcons-eventsecurityoperation
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENTSECURITYOPERATION extends Win32Enum{

    /**
     * Clears the current discretionary access control list (DACL) and adds an ACE to the DACL. The <i>Sid</i>, <i>Rights</i>, and <i>AllowOrDeny</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a> function determine the contents of the ACE (who has access to the provider or session and the type of access). To add a new ACE to the DACL without clearing the existing DACL, specify EventSecurityAddDACL.
     * @type {Integer (Int32)}
     */
    static EventSecuritySetDACL => 0

    /**
     * Clears the current system access control list (SACL) and adds an audit ACE to the SACL. The <i>Sid</i> and <i>Rights</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a> function determine the contents of the ACE (who generates an audit record when attempting the specified access). To add a new ACE to the SACL without clearing the existing SACL, specify EventSecurityAddSACL.
     * @type {Integer (Int32)}
     */
    static EventSecuritySetSACL => 1

    /**
     * Adds an ACE to the current DACL. The <i>Sid</i>, <i>Rights</i>, and <i>AllowOrDeny</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a> function determine the contents of the ACE (who has access to the provider or session and the type of access).
     * @type {Integer (Int32)}
     */
    static EventSecurityAddDACL => 2

    /**
     * Adds an ACE to the current SACL. The <i>Sid</i> and <i>Rights</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/nf-evntcons-eventaccesscontrol">EventAccessControl</a> function determine the contents of the ACE (who generates an audit record when attempting the specified access).
     * @type {Integer (Int32)}
     */
    static EventSecurityAddSACL => 3

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static EventSecurityMax => 4
}
