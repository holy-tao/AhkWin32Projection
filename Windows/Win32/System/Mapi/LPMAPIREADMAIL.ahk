#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\MapiMessage.ahk" { MapiMessage }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIREADMAIL {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIREADMAIL) {
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
     * @param {Pointer<Pointer<MapiMessage>>} lppMessage 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpszMessageID, flFlags, ulReserved, lppMessage) {
        lpszMessageID := lpszMessageID is String ? StrPtr(lpszMessageID) : lpszMessageID

        lppMessageMarshal := lppMessage is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, "ptr", lpszMessageID, UInt32, flFlags, UInt32, ulReserved, lppMessageMarshal, lppMessage, UInt32)
        return result
    }

    /**
     * A LPMAPIREADMAIL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIREADMAIL {
        /**
         * Creates a LPMAPIREADMAIL pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, PSTR, UInt32, UInt32, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, PSTR, UInt32, UInt32, "ptr*", UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
