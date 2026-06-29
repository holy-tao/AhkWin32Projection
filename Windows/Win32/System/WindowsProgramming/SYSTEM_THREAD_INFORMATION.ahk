#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CLIENT_ID.ahk" { CLIENT_ID }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_THREAD_INFORMATION {
    #StructPack 8

    Reserved1 : Int64[3]

    Reserved2 : UInt32

    StartAddress : IntPtr

    ClientId : CLIENT_ID

    Priority : Int32

    BasePriority : Int32

    Reserved3 : UInt32

    ThreadState : UInt32

    WaitReason : UInt32

}
