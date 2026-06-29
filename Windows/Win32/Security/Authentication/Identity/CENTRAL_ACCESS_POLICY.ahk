#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CENTRAL_ACCESS_POLICY_ENTRY.ahk" { CENTRAL_ACCESS_POLICY_ENTRY }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Represents a central access policy that contains a set of central access policy entries.
 * @see https://learn.microsoft.com/windows/win32/api/ntlsa/ns-ntlsa-central_access_policy
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct CENTRAL_ACCESS_POLICY {
    #StructPack 8

    /**
     * The identifier of the central access policy.
     */
    CAPID : PSID

    /**
     * The name of the central access policy.
     */
    Name : LSA_UNICODE_STRING

    /**
     * The description of the central access policy.
     */
    Description : LSA_UNICODE_STRING

    /**
     * An identifier that can be used to version the central access policy.
     */
    ChangeId : LSA_UNICODE_STRING

    /**
     * Reserved.
     */
    Flags : UInt32

    /**
     * The length of the buffer pointed to by the <i>CAPEs</i> field.
     */
    CAPECount : UInt32

    /**
     * Pointer to a buffer of <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/ns-ntlsa-central_access_policy_entry">CENTRAL_ACCESS_POLICY_ENTRY</a> pointers.
     */
    CAPEs : IntPtr

}
