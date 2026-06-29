#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\SETTINGSTATUS.ahk" { SETTINGSTATUS }

/**
 * The POLICYSETTINGSTATUSINFO structure provides information about a policy-setting event.
 * @see https://learn.microsoft.com/windows/win32/api/userenv/ns-userenv-policysettingstatusinfo
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct POLICYSETTINGSTATUSINFO {
    #StructPack 8

    /**
     * This member is optional. If it is <b>NULL</b>, the system generates a value.
     */
    szKey : PWSTR

    /**
     * Pointer to a string specifying the name of the source (application, service, driver, subsystem) that generated the log entry.
     */
    szEventSource : PWSTR

    /**
     * Pointer to a string specifying the name of the event log.
     */
    szEventLogName : PWSTR

    /**
     * Specifies the event log message ID.
     */
    dwEventID : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a> that indicates an error that occurred during the application of the policy setting.
     */
    dwErrorCode : UInt32

    status : SETTINGSTATUS

    /**
     * Specifies a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that indicates the time at which the source generated the event.
     */
    timeLogged : SYSTEMTIME

}
