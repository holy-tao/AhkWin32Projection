#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Header of an access control list (ACL).
 * @remarks
 * 
 * An ACL includes a sequential list of zero or more ACEs. The individual ACEs in an ACL are numbered from 0 to <i>n</i>, where <i>n</i>+1 is the number of ACEs in the ACL. When editing an ACL, an application refers to an ACE within the ACL by the ACE's index.
 * 
 * There are two types of ACL: discretionary and system.
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) is controlled by the owner of an object or anyone granted WRITE_DAC access to the object. It specifies the access particular users and groups can have to an object. For example, the owner of a file can use a DACL to control which users and groups can and cannot have access to the file.
 * 
 * An object can also have system-level security information associated with it, in the form of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL) controlled by a system administrator. A SACL  allows the system administrator to audit any attempts to gain access to an object.
 * 
 * For a list of currently defined ACE structures, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a>.
 * 
 * A fourth ACE structure, <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_ace">SYSTEM_ALARM_ACE</a>, is not currently supported.
 * 
 * The <b>ACL</b> structure is to be treated as though it were opaque and applications are not to attempt to work with its members directly. To ensure that ACLs are semantically correct, applications can use the functions listed in the See Also section to create and manipulate ACLs.
 * 
 * Each <b>ACL</b> and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACE</a> structure begins on a <b>DWORD</b> boundary.
 * 
 * The maximum size for an ACL, including its ACEs, is 64 KB.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-acl
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Specifies the revision level of the ACL. This value should be ACL_REVISION, unless the ACL contains an object-specific ACE, in which case this value must be ACL_REVISION_DS. All ACEs in an ACL must be at the same revision level.
     * @type {Integer}
     */
    AclRevision {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies a zero byte of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">padding</a> that aligns the <b>AclRevision</b> member on a 16-bit boundary.
     * @type {Integer}
     */
    Sbz1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the size, in bytes, of the ACL. This value includes both the <b>ACL</b> structure and all the ACEs.
     * @type {Integer}
     */
    AclSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the number of ACEs stored in the ACL.
     * @type {Integer}
     */
    AceCount {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Specifies two zero-bytes of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">padding</a> that align the <b>ACL</b> structure on a 32-bit boundary.
     * @type {Integer}
     */
    Sbz2 {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
