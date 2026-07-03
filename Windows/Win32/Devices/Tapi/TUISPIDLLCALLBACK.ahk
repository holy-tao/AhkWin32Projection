#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DllCallbackProc function is called by the UI DLL to send a private parameter block to the service provider.
 * @see https://learn.microsoft.com/windows/win32/api/tspi/nc-tspi-tuispidllcallback
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TUISPIDLLCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is TUISPIDLLCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} dwObjectID An object identifier of the type specified by <i>dwObjectType</i>.
     * @param {Integer} dwObjectType One of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tuispidll-object-">TUISPIDLL_OBJECT_</a> constants, specifying the type of object identified by <i>dwObjectID</i>
     * @param {Pointer<Void>} lpParams Pointer to a memory area used to hold a parameter block.
     * @param {Integer} dwSize The size in bytes of the parameter block. 
     * 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If the size parameters in the structure are not correct, there is a possibility that data could get overwritten. For more information on setting structure sizes, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/memory-allocation">memory allocation</a> topic. </div>
     * <div> </div>
     * @returns {Integer} Returns zero if successful, or one of these negative error values:
     * 
     * LINEERR_INVALPARAM, LINEERR_INVALPOINTER, LINEERR_NOMEM, LINEERR_OPERATIONFAILED.
     */
    Call(dwObjectID, dwObjectType, lpParams, dwSize) {
        lpParamsMarshal := lpParams is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, dwObjectID, UInt32, dwObjectType, lpParamsMarshal, lpParams, UInt32, dwSize, Int32)
        return result
    }

    /**
     * A TUISPIDLLCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TUISPIDLLCALLBACK {
        /**
         * Creates a TUISPIDLLCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr", UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr", UInt32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
