#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PLOG_EVENT_ROUTINE.ahk" { PLOG_EVENT_ROUTINE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLRES_FUNCTION_TABLE.ahk" { CLRES_FUNCTION_TABLE }
#Import ".\PSET_RESOURCE_STATUS_ROUTINE.ahk" { PSET_RESOURCE_STATUS_ROUTINE }

/**
 * Loads a resource DLL, returning a structure containing a function table and a version number.
 * @remarks
 * The <i>Startup</i> entry-point function returns a function table 
 *      that describes both the supported interface version of the Resource API and the entry points for all other 
 *      functions required by the supported version of the Resource API.
 * 
 * At present, only Resource API version 1.0 is supported.
 * 
 * If your resource supports more than one version of the Resource API, return a function table for the latest 
 *      version. The version number should be less than or equal to the <i>MaxVersionSupported</i> 
 *      parameter. If the version of the function table pointed to by the <i>FunctionTable</i> 
 *      parameter is not within range, your resource cannot be loaded successfully.
 * 
 * For more information see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-startup">Implementing Startup</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pstartup_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSTARTUP_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSTARTUP_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} _ResourceType Type of resource being started.
     * @param {Integer} MinVersionSupported Minimum version of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-api">Resource API</a> supported by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>.
     * @param {Integer} MaxVersionSupported Maximum version of the Resource API supported by the Cluster service.
     * @param {Pointer<PSET_RESOURCE_STATUS_ROUTINE>} SetResourceStatus Pointer to a callback function that the resource DLL should call to update its status after returning 
     *        <b>ERROR_IO_PENDING</b> from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a>. For more information see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine">SetResourceStatus</a>.
     * @param {Pointer<PLOG_EVENT_ROUTINE>} LogEvent Pointer to a callback function that the resource DLL should call to report events for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a>. For more information see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a>.
     * @param {Pointer<Pointer<CLRES_FUNCTION_TABLE>>} FunctionTable Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clres_function_table">CLRES_FUNCTION_TABLE</a> structure 
     *        that describes the Resource API version and the specific names for the entry points.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * <dt>1306 (0x51A)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource DLL does not support a version that falls in the range identified by the 
     *          <i>MinVersionSupported</i> and <i>MaxVersionSupported</i> 
     *          parameters.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was not successful, <i>Startup</i> should 
     *        return one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     */
    Call(_ResourceType, MinVersionSupported, MaxVersionSupported, SetResourceStatus, LogEvent, FunctionTable) {
        _ResourceType := _ResourceType is String ? StrPtr(_ResourceType) : _ResourceType

        FunctionTableMarshal := FunctionTable is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, "ptr", _ResourceType, UInt32, MinVersionSupported, UInt32, MaxVersionSupported, PSET_RESOURCE_STATUS_ROUTINE, SetResourceStatus, PLOG_EVENT_ROUTINE, LogEvent, FunctionTableMarshal, FunctionTable, UInt32)
        return result
    }

    /**
     * A PSTARTUP_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSTARTUP_ROUTINE {
        /**
         * Creates a PSTARTUP_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, UInt32, PSET_RESOURCE_STATUS_ROUTINE, PLOG_EVENT_ROUTINE, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, UInt32, PSET_RESOURCE_STATUS_ROUTINE, PLOG_EVENT_ROUTINE, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
