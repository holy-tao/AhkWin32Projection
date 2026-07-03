#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\BIDI_REQUEST_CONTAINER.ahk" { BIDI_REQUEST_CONTAINER }
#Import ".\BIDI_RESPONSE_CONTAINER.ahk" { BIDI_RESPONSE_CONTAINER }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PFN_PRINTING_SENDRECVBIDIDATAFROMPORT2 {
    value : IntPtr

    __value {
        set {
            if (value is PFN_PRINTING_SENDRECVBIDIDATAFROMPORT2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Integer} param1 
     * @param {PWSTR} param2 
     * @param {Pointer<BIDI_REQUEST_CONTAINER>} param3 
     * @param {Pointer<Pointer<BIDI_RESPONSE_CONTAINER>>} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        param2 := param2 is String ? StrPtr(param2) : param2

        param4Marshal := param4 is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, UInt32, param1, "ptr", param2, BIDI_REQUEST_CONTAINER.Ptr, param3, param4Marshal, param4, UInt32)
        return result
    }

    /**
     * A PFN_PRINTING_SENDRECVBIDIDATAFROMPORT2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_PRINTING_SENDRECVBIDIDATAFROMPORT2 {
        /**
         * Creates a PFN_PRINTING_SENDRECVBIDIDATAFROMPORT2 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, PWSTR, BIDI_REQUEST_CONTAINER, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, PWSTR, BIDI_REQUEST_CONTAINER.Ptr, "ptr*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
