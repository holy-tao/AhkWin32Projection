#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The POLICY_MODIFICATION_INFO structure is used to query information about the creation time and last modification of the LSA database.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-policy_modification_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_MODIFICATION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure containing a 64-bit unsigned integer that is incremented each time anything in the LSA database is modified. This value is modified only on primary domain controllers.
     * @type {Integer}
     */
    ModifiedId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that indicates the date and time the LSA database was created. This is a UTC-based time that uses the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format. On backup domain controllers, this value is replicated from the primary domain controller. For more information about UTC-based time, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/system-time">System Time</a>.
     * @type {Integer}
     */
    DatabaseCreationTime {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
