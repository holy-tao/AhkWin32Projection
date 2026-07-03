#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Determines whether a resource appears to be available for use.
 * @remarks
 * For effective implementation strategies of the 
 *      <i>LooksAlive</i> entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-looksalive">Implementing LooksAlive</a>.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-plooks_alive_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PLOOKS_ALIVE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PLOOKS_ALIVE_ROUTINE) {
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
     * The resource is probably online and available for use.
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
     * The resource may not be functioning properly.
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
     * A PLOOKS_ALIVE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLOOKS_ALIVE_ROUTINE {
        /**
         * Creates a PLOOKS_ALIVE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
