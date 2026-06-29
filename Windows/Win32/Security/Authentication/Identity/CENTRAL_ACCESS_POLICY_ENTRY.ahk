#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * Represents a central access policy entry containing a list of security descriptors and staged security descriptors.
 * @see https://learn.microsoft.com/windows/win32/api/ntlsa/ns-ntlsa-central_access_policy_entry
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CENTRAL_ACCESS_POLICY_ENTRY {
    #StructPack 8

    /**
     * The name of the central access policy entry.
     */
    Name : LSA_UNICODE_STRING

    /**
     * The description of the central access policy entry.
     */
    Description : LSA_UNICODE_STRING

    /**
     * An identifier that can be used to version the central access policy entry.
     */
    ChangeId : LSA_UNICODE_STRING

    /**
     * The length of the buffer pointed to by the <i>AppliesTo</i> field.
     */
    LengthAppliesTo : UInt32

    /**
     * A resource condition in binary form.
     */
    AppliesTo : IntPtr

    /**
     * The length of the buffer pointed to by the <i>SD</i> field.
     */
    LengthSD : UInt32

    /**
     * A buffer of security descriptors associated with the entry.
     */
    SD : PSECURITY_DESCRIPTOR

    /**
     * The length of the buffer pointed to by the <i>StagedSD</i> field.
     */
    LengthStagedSD : UInt32

    /**
     * A buffer of staged security descriptors associated with the entry.
     */
    StagedSD : PSECURITY_DESCRIPTOR

    /**
     * This field is reserved.
     */
    Flags : UInt32

}
