#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * HCS_PROCESS_INFORMATION
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_PROCESS_INFORMATION
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_PROCESS_INFORMATION {
    #StructPack 8

    /**
     * Identifier of the created process.
     */
    ProcessId : UInt32

    Reserved : UInt32

    /**
     * If created, standard input handle of the process.
     */
    StdInput : HANDLE

    /**
     * If created, standard output handle of the process.
     */
    StdOutput : HANDLE

    /**
     * If created, standard error handle of the process.
     */
    StdError : HANDLE

}
