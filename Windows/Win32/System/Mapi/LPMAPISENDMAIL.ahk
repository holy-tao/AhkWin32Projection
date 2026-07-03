#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MapiMessage.ahk" { MapiMessage }

/**
 * @namespace Windows.Win32.System.Mapi
 * @charset ANSI
 */
export default struct LPMAPISENDMAIL {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPISENDMAIL) {
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
     * @param {Pointer<MapiMessage>} lpMessage 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpMessage, flFlags, ulReserved) {
        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, MapiMessage.Ptr, lpMessage, UInt32, flFlags, UInt32, ulReserved, UInt32)
        return result
    }

    /**
     * A LPMAPISENDMAIL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPISENDMAIL {
        /**
         * Creates a LPMAPISENDMAIL pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, MapiMessage, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, MapiMessage.Ptr, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
