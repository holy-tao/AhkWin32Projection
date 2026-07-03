#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct LPACMDRIVERPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPACMDRIVERPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {HACMDRIVERID} param1 
     * @param {Integer} param2 
     * @param {LPARAM} param3 
     * @param {LPARAM} param4 
     * @returns {LRESULT} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, IntPtr, param0, HACMDRIVERID, param1, UInt32, param2, LPARAM, param3, LPARAM, param4, LRESULT)
        return result
    }

    /**
     * A LPACMDRIVERPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPACMDRIVERPROC {
        /**
         * Creates a LPACMDRIVERPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, HACMDRIVERID, UInt32, LPARAM, LPARAM) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, HACMDRIVERID, UInt32, LPARAM, LPARAM, LRESULT])
        }

        __Delete() => CallbackFree(this.value)
    }
}
