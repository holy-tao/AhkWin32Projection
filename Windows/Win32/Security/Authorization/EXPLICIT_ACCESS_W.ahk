#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRUSTEE_W.ahk

/**
 * Defines access control information for a specified trustee.
 * @remarks
 * 
  * > [!NOTE]
  * > The accctrl.h header defines EXPLICIT_ACCESS_ as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//accctrl/ns-accctrl-explicit_access_w
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset Unicode
 */
class EXPLICIT_ACCESS_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A set of bit flags that use the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> format to specify the access rights that an ACE allows, denies, or audits for the trustee. The functions that use the <b>EXPLICIT_ACCESS</b> structure do not convert, interpret, or validate the bits in this mask.
     * @type {Integer}
     */
    grfAccessPermissions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ne-accctrl-access_mode">ACCESS_MODE</a> enumeration. For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL), this flag indicates whether the ACL allows or denies the specified access rights. For a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL), this flag indicates whether the ACL generates audit messages for successful attempts to use the specified access rights, or failed attempts, or both. When modifying an existing ACL, you can specify the REVOKE_ACCESS flag to remove any existing ACEs for the specified trustee.
     * @type {Integer}
     */
    grfAccessMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A set of bit flags that determines whether other containers or objects can inherit the 
     * ACE from the primary object to which the 
     * ACL is attached. The value of this member corresponds to the inheritance portion (low-order byte) of the <b>AceFlags</b> member of the
     * @type {Integer}
     */
    grfInheritance {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the user, group, or program (such as a Windows service) to which the ACE applies.
     * @type {TRUSTEE_W}
     */
    Trustee{
        get {
            if(!this.HasProp("__Trustee"))
                this.__Trustee := TRUSTEE_W(16, this)
            return this.__Trustee
        }
    }
}
