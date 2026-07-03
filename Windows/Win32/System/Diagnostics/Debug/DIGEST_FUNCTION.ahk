#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An application-defined callback function used by the ImageGetDigestStream function to process data.
 * @remarks
 * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
 * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nc-imagehlp-digest_function
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DIGEST_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is DIGEST_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} refdata A user-supplied handle to the digest. This value is passed as a parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imagehlp/nf-imagehlp-imagegetdigeststream">ImageGetDigestStream</a> function.
     * @param {Pointer<Integer>} pData The data stream.
     * @param {Integer} dwLength The size of the data stream, in bytes.
     * @returns {BOOL} If the function succeeds, the return value should be <b>TRUE</b>. If the function fails, the return value should be <b>FALSE</b>.
     */
    Call(refdata, pData, dwLength) {
        refdataMarshal := refdata is VarRef ? "ptr" : "ptr"
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, refdataMarshal, refdata, pDataMarshal, pData, UInt32, dwLength, BOOL)
        return result
    }

    /**
     * A DIGEST_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DIGEST_FUNCTION {
        /**
         * Creates a DIGEST_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "char*", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "char*", UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
