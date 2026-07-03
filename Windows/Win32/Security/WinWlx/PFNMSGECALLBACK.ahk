#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.WinWlx
 */
export default struct PFNMSGECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFNMSGECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {BOOL} bVerbose 
     * @param {PWSTR} lpMessage 
     * @returns {Integer} 
     */
    Call(bVerbose, lpMessage) {
        lpMessage := lpMessage is String ? StrPtr(lpMessage) : lpMessage

        result := DllCall(this.value, BOOL, bVerbose, "ptr", lpMessage, UInt32)
        return result
    }

    /**
     * A PFNMSGECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNMSGECALLBACK {
        /**
         * Creates a PFNMSGECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(BOOL, PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOL, PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
