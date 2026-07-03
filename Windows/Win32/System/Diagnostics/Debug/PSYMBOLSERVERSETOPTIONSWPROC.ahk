#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PSYMBOLSERVERSETOPTIONSWPROC {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERSETOPTIONSWPROC) {
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
     * @param {Integer} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, IntPtr, param0, Int64, param1, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERSETOPTIONSWPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERSETOPTIONSWPROC {
        /**
         * Creates a PSYMBOLSERVERSETOPTIONSWPROC pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, Int64) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, Int64, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
