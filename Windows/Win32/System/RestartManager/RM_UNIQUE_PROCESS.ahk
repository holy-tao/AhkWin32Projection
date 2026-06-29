#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Uniquely identifies a process by its PID and the time the process began.
 * @remarks
 * The <b>RM_UNIQUE_PROCESS</b> structure can be used to uniquely identify an application in an <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/ns-restartmanager-rm_process_info">RM_PROCESS_INFO</a> structure or  registered with the Restart Manager session by the <a href="https://docs.microsoft.com/windows/desktop/api/restartmanager/nf-restartmanager-rmregisterresources">RmRegisterResources</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ns-restartmanager-rm_unique_process
 * @namespace Windows.Win32.System.RestartManager
 */
export default struct RM_UNIQUE_PROCESS {
    #StructPack 4

    /**
     * The product identifier (PID).
     */
    dwProcessId : UInt32

    /**
     * The creation time of the process. The time is provided as a <b>FILETIME</b> structure that is returned by the <i>lpCreationTime</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocesstimes">GetProcessTimes</a> function.
     */
    ProcessStartTime : FILETIME

}
