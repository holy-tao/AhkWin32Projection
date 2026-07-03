#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Determines whether a resource is available for use.
 * @remarks
 * For effective implementation strategies of the <i>IsAlive</i> 
 *      entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-isalive">Implementing IsAlive</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pis_alive_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PIS_ALIVE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PIS_ALIVE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource Resource identifier for the resource to poll.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is online and functioning properly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not functioning properly.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, BOOL)
        return result
    }

    /**
     * A PIS_ALIVE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIS_ALIVE_ROUTINE {
        /**
         * Creates a PIS_ALIVE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
