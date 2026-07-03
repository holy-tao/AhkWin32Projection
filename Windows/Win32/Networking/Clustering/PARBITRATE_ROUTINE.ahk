#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PQUORUM_RESOURCE_LOST.ahk" { PQUORUM_RESOURCE_LOST }

/**
 * Allows a node to attempt to regain ownership of a quorum resource.
 * @remarks
 * The <i>Arbitrate</i> entry-point function is implemented for 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/quorum-resource">quorum resources</a> only. Expect this function to 
 *      be called only after both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> and 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> have been called.
 * 
 * Implementations of <b>Arbitrate</b> should take less than 300 
 *      milliseconds to complete.
 * 
 * If <b>Arbitrate</b> is successful, make sure that only the 
 *      current node can successfully arbitrate for the quorum resource represented by 
 *      <i>ResourceId</i>. For example, a disk resource can implement a defense by continually 
 *      replacing the reservation made on it once per second.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-parbitrate_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PARBITRATE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PARBITRATE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier for the quorum resource to be owned.
     * @param {Pointer<PQUORUM_RESOURCE_LOST>} LostQuorumResource Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pquorum_resource_lost">QuorumResourceLost</a> callback 
     *        function that should be called if control of the quorum resource is lost after being successfully gained.
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
     * The arbitration was successful and the quorum resource remains defended.
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
     * The arbitration was not successful.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Resource, LostQuorumResource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, PQUORUM_RESOURCE_LOST, LostQuorumResource, UInt32)
        return result
    }

    /**
     * A PARBITRATE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PARBITRATE_ROUTINE {
        /**
         * Creates a PARBITRATE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", PQUORUM_RESOURCE_LOST) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", PQUORUM_RESOURCE_LOST, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
