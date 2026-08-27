#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Mapi
 */
export default struct LPMAPILOGON {
    value : IntPtr

    __value {
        set {
            if (value is LPMAPILOGON) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * @param {Pointer} ulUIParam 
     * @param {PSTR} lpszProfileName 
     * @param {PSTR} lpszPassword 
     * @param {Integer} flFlags 
     * @param {Integer} ulReserved 
     * @param {Pointer<Pointer>} lplhSession 
     * @returns {Integer} 
     */
    Call(ulUIParam, lpszProfileName, lpszPassword, flFlags, ulReserved, lplhSession) {
        lpszProfileName := lpszProfileName is String ? StrPtr(lpszProfileName) : lpszProfileName
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        lpszProfileNameMarshal := lpszProfileName == 0 ? IntPtr : PSTR
        lpszPasswordMarshal := lpszPassword == 0 ? IntPtr : PSTR
        lplhSessionMarshal := lplhSession is VarRef ? "ptr*" : IntPtr

        result := DllCall(this.value, IntPtr, ulUIParam, lpszProfileNameMarshal, lpszProfileName, lpszPasswordMarshal, lpszPassword, UInt32, flFlags, UInt32, ulReserved, lplhSessionMarshal, lplhSession, UInt32)
        return result
    }

    /**
     * A LPMAPILOGON that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPMAPILOGON {
        /**
         * Creates a LPMAPILOGON pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, PSTR, PSTR, UInt32, UInt32, "ptr*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, PSTR, PSTR, UInt32, UInt32, "ptr*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
