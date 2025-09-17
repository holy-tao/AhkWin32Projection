#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies an array of SID structures that represent Windows users or groups.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-policy_audit_sid_array
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_AUDIT_SID_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures in the <b>UserSidArray</b> array.
     * @type {Integer}
     */
    UsersCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures that specify Windows users or groups.
     * @type {Pointer<Void>}
     */
    UserSidArray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
