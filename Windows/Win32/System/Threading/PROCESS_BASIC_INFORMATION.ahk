#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PEB.ahk" { PEB }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_BASIC_INFORMATION {
    #StructPack 8

    ExitStatus : NTSTATUS

    PebBaseAddress : PEB.Ptr

    AffinityMask : IntPtr

    BasePriority : Int32

    UniqueProcessId : IntPtr

    InheritedFromUniqueProcessId : IntPtr

}
