#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MaxMediaLabel callback function determines the maximum size of the media label for the applications supported by the media label library.
 * @remarks
 * When the media format of the media specified in the 
 * <i>MaxMediaLabel</i> function does not have a theoretical size limit, the application should return the size of the largest media label the application can possibly generate.
 * @see https://learn.microsoft.com/windows/win32/api/ntmsmli/nc-ntmsmli-maxmedialabel
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct MAXMEDIALABEL {
    value : IntPtr

    __value {
        set {
            if (value is MAXMEDIALABEL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pMaxSize Pointer to a buffer that receives the maximum size of the buffer sent to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsmli/nc-ntmsmli-claimmedialabel">ClaimMediaLabel</a> function.
     * @returns {Integer} This function returns the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function was successful.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(pMaxSize) {
        pMaxSizeMarshal := pMaxSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, pMaxSizeMarshal, pMaxSize, UInt32)
        return result
    }

    /**
     * A MAXMEDIALABEL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MAXMEDIALABEL {
        /**
         * Creates a MAXMEDIALABEL pointer that invokes the given AHK function when called.
         * @param {Func("uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
