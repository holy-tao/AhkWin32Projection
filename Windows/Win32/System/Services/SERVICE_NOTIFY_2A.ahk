#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERVICE_RUNS_IN_PROCESS.ahk" { SERVICE_RUNS_IN_PROCESS }
#Import ".\SERVICE_STATUS_PROCESS.ahk" { SERVICE_STATUS_PROCESS }
#Import ".\ENUM_SERVICE_TYPE.ahk" { ENUM_SERVICE_TYPE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\SERVICE_STATUS_CURRENT_STATE.ahk" { SERVICE_STATUS_CURRENT_STATE }

/**
 * Represents service status notification information. (ANSI)
 * @remarks
 * The callback function is declared as follows:
 * 
 * 
 * ``` syntax
 * typedef VOID( CALLBACK * PFN_SC_NOTIFY_CALLBACK ) (
 *     IN PVOID pParameter 
 * );
 * ```
 * 
 * The callback function receives a pointer to the <b>SERVICE_NOTIFY</b> structure provided by the caller.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winsvc.h header defines SERVICE_NOTIFY_2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_notify_2a
 * @namespace Windows.Win32.System.Services
 * @charset ANSI
 */
export default struct SERVICE_NOTIFY_2A {
    #StructPack 8

    /**
     * The structure version. This member must be <b>SERVICE_NOTIFY_STATUS_CHANGE</b> (2).
     */
    dwVersion : UInt32

    /**
     * A pointer to the callback function. For more information, see Remarks.
     */
    pfnNotifyCallback : IntPtr

    /**
     * Any user-defined data to be passed to the callback function.
     */
    pContext : IntPtr

    /**
     * A value that indicates the notification status. If this member is <b>ERROR_SUCCESS</b>, the notification has succeeded and the <b>ServiceStatus</b> member contains valid information. If this member is <b>ERROR_SERVICE_MARKED_FOR_DELETE</b>, the service has been marked for deletion and the service handle used by <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-notifyservicestatuschangea">NotifyServiceStatusChange</a> must be closed.
     */
    dwNotificationStatus : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure that contains the service status information. This member is only valid if <b>dwNotificationStatus</b> is <b>ERROR_SUCCESS</b>.
     */
    ServiceStatus : SERVICE_STATUS_PROCESS

    /**
     * If <b>dwNotificationStatus</b> is <b>ERROR_SUCCESS</b>, this member contains a bitmask of the notifications that triggered this call to the callback function.
     */
    dwNotificationTriggered : UInt32

    /**
     * If <b>dwNotificationStatus</b> is <b>ERROR_SUCCESS</b> and the notification is <b>SERVICE_NOTIFY_CREATED</b> or <b>SERVICE_NOTIFY_DELETED</b>, this member is valid and it is a <b>MULTI_SZ</b> string that contains one or more service names. The names of the created services will have a '/' prefix so you can distinguish them from the names of the deleted services.
     * 
     * If this member is valid, the notification callback function must free the string using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     */
    pszServiceNames : PSTR

}
