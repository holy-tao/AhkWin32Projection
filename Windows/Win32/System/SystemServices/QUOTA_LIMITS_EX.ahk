#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RATE_QUOTA_LIMIT.ahk" { RATE_QUOTA_LIMIT }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct QUOTA_LIMITS_EX {
    #StructPack 8

    PagedPoolLimit : IntPtr

    NonPagedPoolLimit : IntPtr

    MinimumWorkingSetSize : IntPtr

    MaximumWorkingSetSize : IntPtr

    PagefileLimit : IntPtr

    TimeLimit : Int64

    WorkingSetLimit : IntPtr

    Reserved2 : IntPtr

    Reserved3 : IntPtr

    Reserved4 : IntPtr

    Flags : UInt32

    CpuRateLimit : RATE_QUOTA_LIMIT

}
