#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct PSYMBOLSERVERGETINDEXSTRINGW {
    value : IntPtr

    __value {
        set {
            if (value is PSYMBOLSERVERGETINDEXSTRINGW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {PWSTR} param3 
     * @param {Pointer} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param3 := param3 is String ? StrPtr(param3) : param3

        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, param0Marshal, param0, UInt32, param1, UInt32, param2, "ptr", param3, IntPtr, param4, BOOL)
        return result
    }

    /**
     * A PSYMBOLSERVERGETINDEXSTRINGW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSYMBOLSERVERGETINDEXSTRINGW {
        /**
         * Creates a PSYMBOLSERVERGETINDEXSTRINGW pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, PWSTR, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, PWSTR, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
