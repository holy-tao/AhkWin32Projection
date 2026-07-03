#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CMSG_STREAM_OUTPUT {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CMSG_STREAM_OUTPUT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pvArg 
     * @param {Integer} pbData 
     * @param {Integer} cbData 
     * @param {BOOL} fFinal 
     * @returns {BOOL} 
     */
    Call(pvArg, pbData, cbData, fFinal) {
        pvArgMarshal := pvArg is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pvArgMarshal, pvArg, IntPtr, pbData, UInt32, cbData, BOOL, fFinal, BOOL)
        return result
    }

    /**
     * A PFN_CMSG_STREAM_OUTPUT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CMSG_STREAM_OUTPUT {
        /**
         * Creates a PFN_CMSG_STREAM_OUTPUT pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, UInt32, BOOL) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, UInt32, BOOL, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
