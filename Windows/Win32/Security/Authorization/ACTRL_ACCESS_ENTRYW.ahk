#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\ACE_FLAGS.ahk" { ACE_FLAGS }
#Import ".\MULTIPLE_TRUSTEE_OPERATION.ahk" { MULTIPLE_TRUSTEE_OPERATION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ACTRL_ACCESS_ENTRY_ACCESS_FLAGS.ahk" { ACTRL_ACCESS_ENTRY_ACCESS_FLAGS }
#Import ".\TRUSTEE_FORM.ahk" { TRUSTEE_FORM }
#Import ".\TRUSTEE_W.ahk" { TRUSTEE_W }
#Import ".\TRUSTEE_TYPE.ahk" { TRUSTEE_TYPE }

/**
 * Contains access-control information for a specified trustee. This structure stores information equivalent to the access-control information stored in an ACE. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The accctrl.h header defines ACTRL_ACCESS_ENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-actrl_access_entryw
 * @namespace Windows.Win32.Security.Authorization
 * @charset Unicode
 */
export default struct ACTRL_ACCESS_ENTRYW {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure that identifies the user, group, or program (such as a service) to which the access-control entry applies.
     */
    Trustee : TRUSTEE_W

    fAccessFlags : ACTRL_ACCESS_ENTRY_ACCESS_FLAGS

    /**
     * A bitmask that specifies the access rights that the entry allows, denies, or audits for the trustee.
     * 
     * This member must use the provider-independent access flags, such as ACTRL_READ_CONTROL, rather than access flags such as READ_CONTROL. The provider for the object type converts these provider-independent flags to the corresponding provider-specific flags.
     * 
     * If you are using this structure with the COM implementation of <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a>, this member must be COM_RIGHTS_EXECUTE.
     * 
     * <a id="ACTRL_SYSTEM_ACCESS"></a>
     * <a id="actrl_system_access"></a>
     */
    Access : UInt32

    /**
     * A bitmask that specifies access rights specific to the provider type. The functions that use the <b>ACTRL_ACCESS_ENTRY</b> structure pass these bits on to the provider without interpreting them. In most cases, this member should be 0.
     */
    ProvSpecificAccess : UInt32

    Inheritance : ACE_FLAGS

    /**
     * A pointer to a null-terminated string that identifies the object types that can inherit the entry. If you are using this structure with the COM implementation of <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a>, this member must be <b>NULL</b>.
     */
    lpInheritProperty : PWSTR

}
