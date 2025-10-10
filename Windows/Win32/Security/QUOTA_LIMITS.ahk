#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the amount of system resources available to a user.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-quota_limits
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class QUOTA_LIMITS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies the amount of paged pool memory assigned to the user. The paged pool is an area of system memory (physical memory used by the operating system) for objects that can be written to disk when they are not being used.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     * @type {Pointer}
     */
    PagedPoolLimit {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the amount of nonpaged pool memory assigned to the user. The nonpaged pool is an area of system memory  for objects that cannot be written to disk but must remain in physical memory as long as they are allocated.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     * @type {Pointer}
     */
    NonPagedPoolLimit {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the minimum set size assigned to the user. The "working set" of a process is the set of memory pages currently visible to the process in physical RAM memory. These pages are present in memory when the application is running and available for an application to use without triggering a page fault.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to <b>NULL</b>, which causes the default value to be used.
     * @type {Pointer}
     */
    MinimumWorkingSetSize {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the maximum set size assigned to the user.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     * @type {Pointer}
     */
    MaximumWorkingSetSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the maximum size, in bytes, of the paging file, which is a reserved space on disk that backs up committed physical memory on the computer.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to 0, which causes the default value to be used.
     * @type {Pointer}
     */
    PagefileLimit {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Indicates the maximum amount of time the process can run.
     * 
     * The value set in this member is not enforced by the LSA. You should set this member to <b>NULL</b>, which causes the default value to be used.
     * @type {Integer}
     */
    TimeLimit {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}
