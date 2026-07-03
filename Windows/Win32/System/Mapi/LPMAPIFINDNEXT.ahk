#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIFINDNEXT {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIFINDNEXT) {
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
     * @param {PSTR} lpszMessageType 
     * @param {PSTR} lpszSeedMessageID 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {PSTR} lpszMessageID 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpszMessageType, lpszSeedMessageID, flFlags, ulReserved, lpszMessageID) {
        lpszMessageType := lpszMessageType is String ? StrPtr(lpszMessageType) : lpszMessageType
        lpszSeedMessageID := lpszSeedMessageID is String ? StrPtr(lpszSeedMessageID) : lpszSeedMessageID
        lpszMessageID := lpszMessageID is String ? StrPtr(lpszMessageID) : lpszMessageID

        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, "ptr", lpszMessageType, "ptr", lpszSeedMessageID, UInt32, flFlags, UInt32, ulReserved, "ptr", lpszMessageID, UInt32)
        return result
    }

    /**
     * A LPMAPIFINDNEXT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIFINDNEXT {
        /**
         * Creates a LPMAPIFINDNEXT pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, PSTR, PSTR, UInt32, UInt32, PSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, PSTR, PSTR, UInt32, UInt32, PSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
