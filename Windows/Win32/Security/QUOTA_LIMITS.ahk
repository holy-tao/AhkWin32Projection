#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the amount of system resources available to a user.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-quota_limits
 * @namespace Windows.Win32.Security
 */
export default struct QUOTA_LIMITS {
    #StructPack 8

    /**
     * Specifies the amount of paged pool memory assigned to the user. The paged pool is an area of system memory (physical memory used by the operating system) for objects that can be written to disk when they are not being used.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     */
    PagedPoolLimit : IntPtr

    /**
     * Specifies the amount of nonpaged pool memory assigned to the user. The nonpaged pool is an area of system memory  for objects that cannot be written to disk but must remain in physical memory as long as they are allocated.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     */
    NonPagedPoolLimit : IntPtr

    /**
     * Specifies the minimum set size assigned to the user. The "working set" of a process is the set of memory pages currently visible to the process in physical RAM memory. These pages are present in memory when the application is running and available for an application to use without triggering a page fault.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to <b>NULL</b>, which causes the default value to be used.
     */
    MinimumWorkingSetSize : IntPtr

    /**
     * Specifies the maximum set size assigned to the user.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     */
    MaximumWorkingSetSize : IntPtr

    /**
     * Specifies the maximum size, in bytes, of the paging file, which is a reserved space on disk that backs up committed physical memory on the computer.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     */
    PagefileLimit : IntPtr

    /**
     * Indicates the maximum amount of time the process can run.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to <b>NULL</b>, which causes the default value to be used.
     */
    TimeLimit : Int64

}
