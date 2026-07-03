#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPWSAOVERLAPPED_COMPLETION_ROUTINE.ahk" { LPWSAOVERLAPPED_COMPLETION_ROUTINE }
#Import ".\WSAMSG.ahk" { WSAMSG }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSASENDMSG {
    #StructPack 8

    lpMsg : WSAMSG.Ptr

    dwFlags : UInt32

    lpNumberOfBytesSent : IntPtr

    lpOverlapped : OVERLAPPED.Ptr

    lpCompletionRoutine : LPWSAOVERLAPPED_COMPLETION_ROUTINE

}
