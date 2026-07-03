#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIDELETEMAIL {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIDELETEMAIL) {
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
     * @param {PSTR} lpszMessageID 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpszMessageID, flFlags, ulReserved) {
        lpszMessageID := lpszMessageID is String ? StrPtr(lpszMessageID) : lpszMessageID

        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, "ptr", lpszMessageID, UInt32, flFlags, UInt32, ulReserved, UInt32)
        return result
    }

    /**
     * A LPMAPIDELETEMAIL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIDELETEMAIL {
        /**
         * Creates a LPMAPIDELETEMAIL pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, PSTR, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, PSTR, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
