#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LOG_LEVEL.ahk" { LOG_LEVEL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Records an event in the cluster log.
 * @remarks
 * The <i>LogEvent</i> callback function is implemented by the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> and is called by a 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to report events and errors to the cluster log. 
 *      Resource DLLs receive a pointer to the <i>LogEvent</i> callback 
 *      function in the <i>LogEvent</i> parameter to their 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> entry-point function.
 * 
 * <i>LogEvent</i> does not write entries to the event log. To 
 *      report events in the event log, a resource DLL must call the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-reporteventa">ReportEvent</a> function.
 * 
 * The format of the logged message appears as follows:
 * 
 * <i>ResourceTypeName</i><b>
 * </b><i>ResourceName</i><b>: </b><i>message</i>
 * 
 * <i>ResourceTypeName</i> is the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a>, such as 
 *      "Generic Application". The specific resource name is the user-friendly name for the specific 
 *      resource, and message is the message delivered by the resource DLL to the Resource Monitor.
 * 
 * The log entry size is limited to 500 characters.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-plog_event_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PLOG_EVENT_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PLOG_EVENT_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle Handle identifying the resource recording the event. The value for <i>ResourceHandle</i> 
     *        should be the handle passed in during the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> call for this 
     *        resource.
     * @param {LOG_LEVEL} LogLevel Value enumerated by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ne-resapi-log_level">LOG_LEVEL</a> enumeration that 
     *        represents the log level of the event and that is for information only. The following valid values are shown in 
     *        order from least to most severe.
     * @param {PWSTR} FormatString Null-terminated Unicode string that includes the information to be recorded. This string must be in the same 
     *        format as that passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> 
     *        function.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ResourceHandle, LogLevel, FormatString) {
        FormatString := FormatString is String ? StrPtr(FormatString) : FormatString

        DllCall(this.value, IntPtr, ResourceHandle, LOG_LEVEL, LogLevel, "ptr", FormatString)
    }

    /**
     * A PLOG_EVENT_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLOG_EVENT_ROUTINE {
        /**
         * Creates a PLOG_EVENT_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, LOG_LEVEL, PWSTR) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [IntPtr, LOG_LEVEL, PWSTR, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
