#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\MapiMessage.ahk" { MapiMessage }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPISAVEMAIL {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPISAVEMAIL) {
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
     * @param {PSTR} lpszMessageID 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpMessage, flFlags, ulReserved, lpszMessageID) {
        lpszMessageID := lpszMessageID is String ? StrPtr(lpszMessageID) : lpszMessageID

        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, MapiMessage.Ptr, lpMessage, UInt32, flFlags, UInt32, ulReserved, "ptr", lpszMessageID, UInt32)
        return result
    }

    /**
     * A LPMAPISAVEMAIL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPISAVEMAIL {
        /**
         * Creates a LPMAPISAVEMAIL pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, MapiMessage, UInt32, UInt32, PSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, MapiMessage.Ptr, UInt32, UInt32, PSTR, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
