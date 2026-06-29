#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The POLICY_MODIFICATION_INFO structure is used to query information about the creation time and last modification of the LSA database.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-policy_modification_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_MODIFICATION_INFO {
    #StructPack 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure containing a 64-bit unsigned integer that is incremented each time anything in the LSA database is modified. This value is modified only on primary domain controllers.
     */
    ModifiedId : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a> structure that indicates the date and time the LSA database was created. This is a UTC-based time that uses the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format. On backup domain controllers, this value is replicated from the primary domain controller. For more information about UTC-based time, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/system-time">System Time</a>.
     */
    DatabaseCreationTime : Int64

}
