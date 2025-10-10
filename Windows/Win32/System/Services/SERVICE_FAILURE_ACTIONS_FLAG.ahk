#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the failure actions flag setting of a service. This setting determines when failure actions are to be executed.
 * @remarks
 * 
  * The change takes effect the next time the system is started.
  * 
  * It can be useful to set this flag if your service has common failure paths where is it possible that the service could recover.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsvc/ns-winsvc-service_failure_actions_flag
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_FAILURE_ACTIONS_FLAG extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * If this member is <b>TRUE</b> and the service has configured failure actions, the failure actions are queued if the service process terminates without reporting a status of SERVICE_STOPPED or if it enters the SERVICE_STOPPED state but the <b>dwWin32ExitCode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure is not ERROR_SUCCESS (0).
     * 
     * If this member is <b>FALSE</b> and the service has configured failure actions, the failure actions are queued only if the service terminates without reporting a status of SERVICE_STOPPED.
     * 
     * This setting is ignored unless the service has configured failure actions. For information on configuring failure actions, see <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>.
     * @type {Integer}
     */
    fFailureActionsOnNonCrashFailures {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
