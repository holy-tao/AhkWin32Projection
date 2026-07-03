#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }

/**
 * The POPEN_ROUTINE callback function opens a resource. The POPEN_ROUTINE type defines a pointer to this function.
 * @remarks
 * The <i>Open</i> entry-point function opens a resource with the name 
 *      identified by the <i>ResourceName</i> parameter and returns its resource identifier. The 
 *      resource identifier can be used in future calls to other 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-api">Resource API</a> entry points to identify the resource.
 * 
 * Never close the handle represented by the <i>ResourceHandle</i> parameter or use it for any 
 *      purpose other than passing it to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> 
 *      through either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> callback function or the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine">SetResourceStatus</a> callback function.
 * 
 * For effective implementation strategies of the <i>Open</i> 
 *      entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-open">Implementing Open</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-popen_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POPEN_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is POPEN_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} ResourceName Name of the resource to open.
     * @param {HKEY} ResourceKey <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">Cluster database</a> key for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> that includes the resource represented by 
     *        <i>ResourceName</i>.
     * @param {Pointer} ResourceHandle Handle to be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pset_resource_status_routine">SetResourceStatus</a> 
     *        callback function in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> entry-point function.
     * @returns {Pointer<Void>} If the operation was successful, <i>Open</i> returns a resource 
     *        identifier (<b>RESID</b>).
     * 
     * If the operation was not successful, <i>Open</i> returns 
     *        <b>NULL</b>. Call  <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> to 
     *        specify that an error has occurred.
     */
    Call(ResourceName, ResourceKey, ResourceHandle) {
        ResourceName := ResourceName is String ? StrPtr(ResourceName) : ResourceName

        result := DllCall(this.value, "ptr", ResourceName, HKEY, ResourceKey, IntPtr, ResourceHandle, IntPtr)
        return result
    }

    /**
     * A POPEN_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POPEN_ROUTINE {
        /**
         * Creates a POPEN_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HKEY, IntPtr) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HKEY, IntPtr, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
