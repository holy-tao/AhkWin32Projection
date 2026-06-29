#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\PSID.ahk" { PSID }

/**
 * Specifies an array of SID structures that represent Windows users or groups.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-policy_audit_sid_array
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_AUDIT_SID_ARRAY {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures in the <b>UserSidArray</b> array.
     */
    UsersCount : UInt32

    /**
     * A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures that specify Windows users or groups.
     */
    UserSidArray : PSID.Ptr

}
