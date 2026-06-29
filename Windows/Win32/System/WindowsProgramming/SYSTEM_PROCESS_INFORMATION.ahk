#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_PROCESS_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    NumberOfThreads : UInt32

    Reserved1 : Int8[48]

    ImageName : UNICODE_STRING

    BasePriority : Int32

    UniqueProcessId : HANDLE

    Reserved2 : IntPtr

    HandleCount : UInt32

    SessionId : UInt32

    Reserved3 : IntPtr

    PeakVirtualSize : IntPtr

    VirtualSize : IntPtr

    Reserved4 : UInt32

    PeakWorkingSetSize : IntPtr

    WorkingSetSize : IntPtr

    Reserved5 : IntPtr

    QuotaPagedPoolUsage : IntPtr

    Reserved6 : IntPtr

    QuotaNonPagedPoolUsage : IntPtr

    PagefileUsage : IntPtr

    PeakPagefileUsage : IntPtr

    PrivatePageCount : IntPtr

    Reserved7 : Int64[6]

}
