#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\MapiRecipDesc.ahk" { MapiRecipDesc }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPIRESOLVENAME {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPIRESOLVENAME) {
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
     * @param {PSTR} lpszName 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {Pointer<Pointer<MapiRecipDesc>>} lppRecip 
     * @returns {Integer} 
     */
    Call(lhSession, ulUIParam, lpszName, flFlags, ulReserved, lppRecip) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        lppRecipMarshal := lppRecip is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, IntPtr, lhSession, IntPtr, ulUIParam, "ptr", lpszName, UInt32, flFlags, UInt32, ulReserved, lppRecipMarshal, lppRecip, UInt32)
        return result
    }

    /**
     * A LPMAPIRESOLVENAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPIRESOLVENAME {
        /**
         * Creates a LPMAPIRESOLVENAME pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, PSTR, UInt32, UInt32, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, PSTR, UInt32, UInt32, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
