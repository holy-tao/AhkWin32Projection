#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_STATUS_PROCESS.ahk

/**
 * Represents service status notification information. (Unicode)
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
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_notify_2w
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset Unicode
 */
class SERVICE_NOTIFY_2W extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The structure version. This member must be <b>SERVICE_NOTIFY_STATUS_CHANGE</b> (2).
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the callback function. For more information, see Remarks.
     * @type {Pointer<PFN_SC_NOTIFY_CALLBACK>}
     */
    pfnNotifyCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Any user-defined data to be passed to the callback function.
     * @type {Pointer<Void>}
     */
    pContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A value that indicates the notification status. If this member is <b>ERROR_SUCCESS</b>, the notification has succeeded and the <b>ServiceStatus</b> member contains valid information. If this member is <b>ERROR_SERVICE_MARKED_FOR_DELETE</b>, the service has been marked for deletion and the service handle used by <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-notifyservicestatuschangea">NotifyServiceStatusChange</a> must be closed.
     * @type {Integer}
     */
    dwNotificationStatus {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure that contains the service status information. This member is only valid if <b>dwNotificationStatus</b> is <b>ERROR_SUCCESS</b>.
     * @type {SERVICE_STATUS_PROCESS}
     */
    ServiceStatus{
        get {
            if(!this.HasProp("__ServiceStatus"))
                this.__ServiceStatus := SERVICE_STATUS_PROCESS(this.ptr + 32)
            return this.__ServiceStatus
        }
    }

    /**
     * If <b>dwNotificationStatus</b> is <b>ERROR_SUCCESS</b>, this member contains a bitmask of the notifications that triggered this call to the callback function.
     * @type {Integer}
     */
    dwNotificationTriggered {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * If <b>dwNotificationStatus</b> is <b>ERROR_SUCCESS</b> and the notification is <b>SERVICE_NOTIFY_CREATED</b> or <b>SERVICE_NOTIFY_DELETED</b>, this member is valid and it is a <b>MULTI_SZ</b> string that contains one or more service names. The names of the created services will have a '/' prefix so you can distinguish them from the names of the deleted services.
     * 
     * If this member is valid, the notification callback function must free the string using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @type {Pointer<PWSTR>}
     */
    pszServiceNames {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
