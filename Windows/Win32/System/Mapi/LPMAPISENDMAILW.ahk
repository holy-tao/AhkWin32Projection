#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MapiMessageW.ahk" { MapiMessageW }

/**
 * @namespace Windows.Win32.System.Mapi
 * @charset Unicode
 */
export default struct LPMAPISENDMAILW {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPISENDMAILW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} lhSession 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<MapiMessageW>} lpMessage 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpMessage, flFlags, ulReserved) {
        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, MapiMessageW.Ptr, lpMessage, UInt32, flFlags, UInt32, ulReserved, UInt32)
        return result
    }

    /**
     * A LPMAPISENDMAILW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPISENDMAILW {
        /**
         * Creates a LPMAPISENDMAILW pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, MapiMessageW, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, MapiMessageW.Ptr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
