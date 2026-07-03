#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Releases the quorum resource from arbitration.
 * @remarks
 * The <i>Release</i> entry-point function is implemented for quorum 
 *      resources only. A quorum resource might have to be released when the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a> is shut down or when the quorum resource 
 *      has to be physically moved to a different <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> in the cluster.
 * 
 * <div class="alert"><b>Note</b>  All disk resources must explicitly call their own 
 *     <i>Release</i> in their  implementation of the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> callback, since one is not made by the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-prelease_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRELEASE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PRELEASE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier for the quorum resource to be released.
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
     * The quorum resource was successfully released and is no longer being defended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">Error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The quorum resource was not successfully released.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, UInt32)
        return result
    }

    /**
     * A PRELEASE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRELEASE_ROUTINE {
        /**
         * Creates a PRELEASE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
