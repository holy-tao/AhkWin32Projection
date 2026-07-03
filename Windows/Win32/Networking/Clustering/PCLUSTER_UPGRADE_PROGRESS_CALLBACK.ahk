#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CLUSTER_UPGRADE_PHASE.ahk" { CLUSTER_UPGRADE_PHASE }

/**
 * Retrieves status information for a rolling upgrade of the operating system on a cluster. PCLUSTER_UPGRADE_PROGRESS_CALLBACK type defines a pointer to this function.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/nc-clusapi-pcluster_upgrade_progress_callback
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCLUSTER_UPGRADE_PROGRESS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PCLUSTER_UPGRADE_PROGRESS_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvCallbackArg A pointer to the arguments.
     * @param {CLUSTER_UPGRADE_PHASE} eUpgradePhase A  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_upgrade_phase">CLUSTER_UPGRADE_PHASE</a> enumeration values that indicates the state of the rolling upgrade.
     * @returns {BOOL} This function returns one of the following values:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pvCallbackArg, eUpgradePhase) {
        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvCallbackArgMarshal, pvCallbackArg, CLUSTER_UPGRADE_PHASE, eUpgradePhase, BOOL)
        return result
    }

    /**
     * A PCLUSTER_UPGRADE_PROGRESS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCLUSTER_UPGRADE_PROGRESS_CALLBACK {
        /**
         * Creates a PCLUSTER_UPGRADE_PROGRESS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", CLUSTER_UPGRADE_PHASE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", CLUSTER_UPGRADE_PHASE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
