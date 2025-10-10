#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the user account, group account, or logon session to which an access control entry (ACE) applies.
 * @remarks
 * 
  * A trustee name can have any of the following formats:
  * 
  * <ul>
  * <li>A fully qualified name, such as "g:\remotedir\abc".</li>
  * <li>A domain account, such as "domain1\xyz".</li>
  * <li>One of the predefined group names, such as "EVERYONE" or "GUEST".</li>
  * <li>One of the following special names. <table>
  * <tr>
  * <th>Name</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>CREATOR GROUP</td>
  * <td>The CREATOR_GROUP SID is a SID used in inheritable ACEs. When a new object is created, the system replaces this SID with the primary group SID of the user who created the object.</td>
  * </tr>
  * <tr>
  * <td>CREATOR OWNER</td>
  * <td>The CREATOR_OWNER SID is a SID used in inheritable ACEs. When a new object is created, the system replaces this SID with the SID of the user who created the object.</td>
  * </tr>
  * <tr>
  * <td>CURRENT_USER</td>
  * <td>The owner of the calling thread or process.</td>
  * </tr>
  * </table>
  *  
  * 
  * </li>
  * </ul>
  * A trustee SID can be any user or group SID. It can also be any of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">universal, well-known SIDs</a>. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The accctrl.h header defines TRUSTEE_ as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//accctrl/ns-accctrl-trustee_w
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset Unicode
 */
class TRUSTEE_W extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a <b>TRUSTEE</b> structure that identifies a server account that can impersonate the user identified by the <b>ptstrName</b> member. This member is not currently supported and must be <b>NULL</b>.
     * @type {Pointer<TRUSTEE_W>}
     */
    pMultipleTrustee {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A value of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-multiple_trustee_operation">MULTIPLE_TRUSTEE_OPERATION</a> enumeration type. Currently, this member must be NO_MULTIPLE_TRUSTEE.
     * @type {Integer}
     */
    MultipleTrusteeOperation {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-trustee_form">TRUSTEE_FORM</a> enumeration type that indicates the type of data pointed to by the <b>ptstrName</b> member.
     * @type {Integer}
     */
    TrusteeForm {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-trustee_type">TRUSTEE_TYPE</a> enumeration type that indicates whether the trustee is a user account, a group account, or an unknown account type.
     * @type {Integer}
     */
    TrusteeType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A pointer to a buffer that identifies the trustee and, optionally, contains information about object-specific ACEs. The type of data depends on the value of the <b>TrusteeForm</b> member.
     * @type {Pointer<Char>}
     */
    ptstrName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
