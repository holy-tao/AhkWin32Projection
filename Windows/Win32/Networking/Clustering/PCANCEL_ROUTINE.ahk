#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Cancels an operation on a resource.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pcancel_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PCANCEL_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PCANCEL_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} Resource The resource ID of the resource.
     * @param {Integer} CancelFlags_RESERVED Reserved.
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
     * <dt><b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/msipc/error-codes">Error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successfully canceled.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Resource, CancelFlags_RESERVED) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, ResourceMarshal, Resource, UInt32, CancelFlags_RESERVED, UInt32)
        return result
    }

    /**
     * A PCANCEL_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCANCEL_ROUTINE {
        /**
         * Creates a PCANCEL_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
