#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRUSTEE_A.ahk

/**
 * Contains access-control information for a specified trustee. This structure stores information equivalent to the access-control information stored in an ACE. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The accctrl.h header defines ACTRL_ACCESS_ENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-actrl_access_entrya
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset ANSI
 */
class ACTRL_ACCESS_ENTRYA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the user, group, or program (such as a service) to which the access-control entry applies.
     * @type {TRUSTEE_A}
     */
    Trustee{
        get {
            if(!this.HasProp("__Trustee"))
                this.__Trustee := TRUSTEE_A(this.ptr + 0)
            return this.__Trustee
        }
    }

    /**
     * 
     * @type {Integer}
     */
    fAccessFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A bitmask that specifies the access rights that the entry allows, denies, or audits for the trustee.
     * 
     * This member must use the provider-independent access flags, such as ACTRL_READ_CONTROL, rather than access flags such as READ_CONTROL. The provider for the object type converts these provider-independent flags to the corresponding provider-specific flags.
     * 
     * If you are using this structure with the COM implementation of <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a>, this member must be COM_RIGHTS_EXECUTE.
     * 
     * <a id="ACTRL_SYSTEM_ACCESS"></a>
     * <a id="actrl_system_access"></a>
     * @type {Integer}
     */
    Access {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A bitmask that specifies access rights specific to the provider type. The functions that use the <b>ACTRL_ACCESS_ENTRY</b> structure pass these bits on to the provider without interpreting them. In most cases, this member should be 0.
     * @type {Integer}
     */
    ProvSpecificAccess {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    Inheritance {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * A pointer to a null-terminated string that identifies the object types that can inherit the entry. If you are using this structure with the COM implementation of <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a>, this member must be <b>NULL</b>.
     * @type {Pointer<PSTR>}
     */
    lpInheritProperty {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
